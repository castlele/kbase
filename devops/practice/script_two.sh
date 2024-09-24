#!/bin/bash

# Напишите Bash-скрипт для анализа лог-файлов в указанной директории. Скрипт
# должен найти все файлы с расширением «.log» в указанной директории и подсчитать
# количество строк, содержащих определенное ключевое слово (например, «ERROR» или
# «Exception»). Ключевое слово должно быть задано в переменной в начале скрипта.
# Скрипт должен выводить сообщение в формате: «Файл [ИМЯ ФАЙЛА] содержит
# [КОЛИЧЕСТВО СТРОК С КЛЮЧЕВЫМ СЛОВОМ] строк с ключевым словом [КЛЮЧЕВОЕ СЛОВО]».
# В конце скрипта выведите общее количество строк с ключевым словом по всем
# лог-файлам в данной директории.

KEYWORD=$1
LOGS_DIR=$2
FILE_FINDING_PATTERN="*.log"

if [ -z $KEYWORD ]; then
    KEYWORD="TRACE"
fi

if [ -z $LOGS_DIR ]; then
    LOGS_DIR="./logs"
fi

count_lines_in_logs() {
    overall_lines_with_keyword=0

    for log_file in $(find $LOGS_DIR -type f -name $FILE_FINDING_PATTERN); do
        lines_with_keyword=$(grep $KEYWORD $log_file | wc -l | awk '{ print $1 }')
        echo $lines_with_keyword
    done
}

count_lines_in_logs
