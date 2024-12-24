Код приложения:

```go
package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello from practice for MIFI!")
}

func main() {
	http.HandleFunc("/", helloHandler)
	http.ListenAndServe(":8080", nil)
}
```

Код в `Dockerfile`:
```Dockerfile
# Исходный образ
FROM golang:alpine

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем основный скрипт запуска программы
COPY main.go .

# Вызываем комманду сборки приложения
RUN go build -o main main.go

# Открываем порт 8080
EXPOSE 8080

# Запускаем приложение
CMD ["./main"]
```

Сборка образа: `docker build -t goapp .`
Запуск контейнера: `docker run -d -p 8080:8080 goapp`

Результат выполнения команд:
![[docker_container_running_practice.png]]

Вывод списка всех запущенных контейнеров:
![[available_docker_conteiners_practice.png]]

Результат запуска `curl`:
![[docker_go_app_result_practice.png]]