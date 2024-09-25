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

    # For every **file** in the given directory with the *.log name pattern
    for log_file in $(find $LOGS_DIR -type f -name $FILE_FINDING_PATTERN); do
        # 1. Find lines with the keyword in every file
        # 2. Count amount of lines with the keyword
        # 3. Take only amount
        lines_with_keyword=$(grep $KEYWORD $log_file | wc -l | awk '{ print $1 }')
        overall_lines_with_keyword=$(expr $overall_lines_with_keyword + $lines_with_keyword)
        echo "Файл [$log_file] содержит [$lines_with_keyword] строк с ключевым словом [$KEYWORD]"
    done

    echo ""
    echo "------"
    echo "Всего строк с ключевым словом: $overall_lines_with_keyword"
}

count_lines_in_logs
