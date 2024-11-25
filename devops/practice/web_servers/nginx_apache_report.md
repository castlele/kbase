# Первая часть:

## 1. Запуск сервера
Установил и запустил apache на Ubuntu через:

```bash
sudo apt install apache2
sudo systemctl start apache2
```

Отредактировал index.html для проверки работы web сервера, перезапустил сервер через `sudo systemctl restart apache2`.

Проверка статуса сервера:

![[apache_server_status_console.png]]

Проверка в браузере:

![[apache_server_status.png]]

## 2. Настройка https

Сначала создал сертификат:

```bash
sudo mkdir /etc/apache2/certificate
cd /etc/apache2/certificate
sudo openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out apache-certificate.crt -keyout apache.key
```