#!/bin/bash

# Напишите конвейер, который будет использовать команды ps, grep и awk для
# мониторинга активных процессов в системе. Результаты должны быть отсортированы
# по использованию ресурсов, и информация должна быть записана в файл
# «system_monitoring.txt»
first_task() {
    USER=$1
    OUTPUT_FILE=system_monitoring.txt

    # 1. get processes info for $USER: pid, cpu usage, memory usage, command
    ps -o pid,%cpu,%mem,comm -u$USER | \
        # 2. remove header line
        awk 'NR>1'| \
        # 3. sort ascending by memory usage column
        sort -k 3 > \
        $OUTPUT_FILE
}

# Напишите конвейер, который сравнивает содержимое двух директорий. Используйте
# команды find, sort, и diff для поиска и сравнения файлов в двух директориях.
# Результат сравнения сохраните в файл «directory_comparison.txt».
second_task() {
    LHS_DIR=$1
    RHS_DIR=$2
    OUTPUT_FILE=directory_comparison.txt

    diff $LHS_DIR $RHS_DIR > $OUTPUT_FILE
}

third_task() {
}

test() {
    echo "Ececuting $1"
    $2
}

test "first task" "first_task castlelecs"
test "second task" "second_task dir1 dir2"
