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
![[apache_server_status_browser.png]]

## 2. Настройка https

Сначала создал сертификат:

```bash
sudo mkdir /etc/apache2/certificate
cd /etc/apache2/certificate
sudo openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out apache-certificate.crt -keyout apache.key
```

Отредактировав файл `000-default.conf` для включения `SSLEngine` получаю рабочий https:

![[apache_server_https_status.png]]

# Вторая часть

## Установка nginx

Устанавливаю и запускаю сервис nginx:

```bash
sudo apt install nginx
sudo systemctl start nginx
```

Проверка через команду `sudo systemctl status nginx`:
![[nginx_server_status.png]]

Проверка через браузер:
![[nginx_server_status_browser.png]]
## Настройка прямого и обратного proxy

```bash
 server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                try_files $uri $uri/ =404;
        }

        return 301 http://127.0.0.1:443;
}

server {
        listen 443;
        server_name localhost:443;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        location / {
                proxy_buffering off;
                proxy_pass http://127.0.0.1:443;
                proxy_set_header Host $host;
                proxy_set_header X-Forwarded-Port  $server_port;
                proxy_set_header X-Real-IP  $remote_addr;
        }
}
```

После этого при переходе на localhost с портом 80, сайт автматически редиректится на порт 443:

![[nginx_server_redirecting.gif]]
## Настройка https
Сгенерировал сертификат:

```bash
sudo openssl req -nodes -x509 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/private/nginx.crt -days 365
```


Обновил настройку сервера для использования ssl:
```
server {
        listen 443;
        server_name localhost:443;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        ssl     on;

        ssl_certificate         /etc/ssl/private/nginx.crt;
        ssl_certificate_key     /etc/ssl/private/nginx.key;

        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';
        ssl_prefer_server_ciphers off;

        location / {
                proxy_ssl_server_name on;
                proxy_pass https://127.0.0.1:443;
                proxy_set_header Host $host;
                proxy_set_header X-Forwarded-Port  $server_port;
                proxy_set_header X-Real-IP  $remote_addr;
        }
}
```


Проверил в браузере:
![[nginx_server_https_status.png]]
## Настройка ModSecurity

Установка:
