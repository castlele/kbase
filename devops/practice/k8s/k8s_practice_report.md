Подготовка окружения:
- Настройка Kubernetes кластер Minikube
![[k8s_minikube_setup.png]]
- Настройка kubectl
![[k8s_kubectl_setup.png]]
- В качестве проекта выбрал маленькое тестовое веб [приложение](https://gitlab.com/castlele/test_proj):

Установка GitLab K8s Agent:
- Установка агента в k8s кластер:
![[k8s_gitlab_setup_agent.png]]
![[k8s_helm_setup.png]]
![[k8s_agent_status.png]]

Далее переходим к созданию проекта и добавлению приложения:
- В корне репозитория создал `Dockerfile` со следующим содержимым:
```Dockerfile
# Исходный образ
FROM golang:alpine

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем основный скрипт запуска программы
COPY main.go .

# Вызываем комманду сборки приложения
RUN go build -o main main.go

# Открываем порт 5000
EXPOSE 5000

# Запускаем приложение
CMD ["./main"]
```

- deployment-staging манифест `./k8s/deployment-staging.yaml:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: k8s_test_staging
spec:
  replicas: 1
  selector:
    matchLabels:
      app: k8s_test
  template:
    metadata:
      labels:
        app: k8s_test
    spec:
      containers:
        - name: k8s_test
          image: registry.gitlab.com/castlele/test_proj:test
          ports:
          - containerPort: 5000
        imagePullSecrets:
          - name: gitlab-registry-secret
```
- deployment-production манифест `./k8s/deployment-production.yaml:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: k8s_test_production
spec:
  replicas: 1
  selector:
    matchLabels:
      app: k8s_test
  template:
    metadata:
      labels:
        app: k8s_test
    spec:
      containers:
        - name: k8s_test
          image: registry.gitlab.com/castlele/test_proj:main
          ports:
          - containerPort: 5000
        imagePullSecrets:
          - name: gitlab-registry-secret
```
- service-staging манифест `./k8s/service-staging.yaml:
```yaml
apiVersion: apps/v1
kind: Service
metadata:
  name: k8s_test_staging
spec:
  selector:
    app: k8s_test
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
      nodePort: 30003
  type: NodePort
```
- service-production манифест `./k8s/service-production.yaml:
```yaml
apiVersion: apps/v1
kind: Service
metadata:
  name: k8s_test_production
spec:
  selector:
    app: k8s_test
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
      nodePort: 30005
  type: NodePort
```

Переходим к CI/CD контейнеру в GitLab. Для этого настраиваю файл с пайплайном `.gitlab-ci.yml`, его содержимое:
```yaml
stages:
- build
- test
- deploy_staging
- deploy_production

variables:
  DOCKER_REGISTRY: registry.gitlab.com
  DOCKER_IMAGE: registry.gitlab.com/castlele/test_proj

before_script:
  - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $DOCKER_REGISTRY

build:
  stage: build
  script:
    - docker build -t $DOCKER_IMAGE:$CI_COMMIT_REF_NAME .
    - docker push $DOCKER_IMAGE:$CI_COMMIT_REF_NAME
  only:
    - branches

test:
  stage: test
  script:
    - echo "Sub Testing..."
  only:
    - branches

deploy_staging:
  stage: deploy_staging
  script:
    - kubectl config use-context castlele/test_proj:k8s_agent
    - kubectl apply -f k8s/deployment-staging.yaml
    - kubectl apply -f k8s/service-staging.yaml
  environment:
    name: staging
    url: http://127.0.0.1:30003/
  only:
    - test

deploy_production:
  stage: deploy_production
  script:
    - kubectl config use-context castlele/test_proj:k8s_agent
    - kubectl apply -f k8s/deployment-production.yaml
    - kubectl apply -f k8s/service-production.yaml
  environment:
    name: staging
    url: http://127.0.0.1:30005/
  only:
    - main
```

Далее создаем environment:
![[k8s_gitlab_env.png]]