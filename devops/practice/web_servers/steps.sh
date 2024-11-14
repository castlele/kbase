#!/bin/bash

apache() {
    # brew install httpd
    # sudo apachectl stop
    # sudo apachectl start
    sudo apachectl restart

#    sudo echo "<Directory /var/www/html>
#AllowOverride All
#</Directory>" >> /etc/apache2/httpd.conf
}

apache_ssl() {
    cd /etc/apache2/
    sudo mkdir certificates

    cd certificates
}

clear_apache() {
    brew uninstall httpd
    sudo rm -rf /etc/apache2/
    sudo openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out apache-certificate.crt -keyout apache.key
}

main() {
    apache
    # clear_apache
}

main
