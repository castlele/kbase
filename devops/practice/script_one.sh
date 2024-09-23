#!/bin/bash

# Создайте Bash-скрипт, который будет проверять доступность нескольких хостов в
# вашей локальной сети. Список хостов (IP-адреса или доменные имена) должен быть
# задан в переменной в начале скрипта. Скрипт должен последовательно проверять
# каждый хост на доступность с использованием команды ping. Если хост доступен,
# выведите сообщение «Хост [ИМЯ ХОСТА] доступен», если нет — выведите сообщение
# «Хост [ИМЯ ХОСТА] недоступен». В конце скрипта выведите общее количество
# доступных и недоступных хостов.

HOSTS=(google.com asldkjf.ru apps.skillfactory.ru)

# Timeout in seconds
TIMEOUT=5

ping_hosts() {
    AVAILABLE_COUNT=0
    UNAVAILABLE_COUNT=0

    for host in ${HOSTS[@]}; do
        ping -c 1 -o $host -t $TIMEOUT &> /dev/null

        if [ $? -eq "0" ]; then
            echo "Хост [$host] доступен"
            AVAILABLE_COUNT=$(expr $AVAILABLE_COUNT + 1)
        else
            echo "Хост [$host] недоступен"
            UNAVAILABLE_COUNT=$(expr $UNAVAILABLE_COUNT + 1)
        fi
    done

    echo ""
    echo "------"
    echo "Доступно хостов: $AVAILABLE_COUNT"
    echo "Недоступно хостов: $UNAVAILABLE_COUNT"
}

ping_hosts
