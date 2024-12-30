Для начала создаем *ansible* проект:
![[ansible_proj_setup.png]]

Далее настраиваем роли:
![[ansible_role_setup.png]]

После наполняем контентом файлы:
- `practice.ini`:
![[ansible_ini_setup.png]]
- `playbook.yaml`:
![[ansible_playbook_setup.png]]

Настройка nginx по пути `nginx/tasks/main.yml`:
![[ansible_nginx_task_setup.png]]

Настройка apache по пути `apache/tasks/main.yml`:
![[ansible_apache_task_setup.png]]

Запускаю `playbook`:
![[ansible_run_playbook.png]]

Проверяю через браузер:
![[ansible_test_nginx.png]]
![[ansible_test_apache.png]]