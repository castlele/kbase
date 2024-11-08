#!/bin/bash

# Напишите конвейер, который будет использовать команды ps, grep и awk для
# мониторинга активных процессов в системе. Результаты должны быть отсортированы
# по использованию ресурсов, и информация должна быть записана в файл
# «system_monitoring.txt»
first_task() {
    USER=$1
    FILTER_WORD=$2
    OUTPUT_FILE=system_monitoring.txt

    # 1. get processes info for $USER: pid, cpu usage, memory usage, command
    ps -o pid,%cpu,%mem,comm -u$USER | \
        # 2. filter by keyword
        grep $FILTER_WORD | \
        # 3. remove header line
        awk 'NR>1'| \
        # 4. sort ascending by memory usage column
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

    diff <(find $LHS_DIR | sort) <(find $RHS_DIR | sort) > $OUTPUT_FILE
}

# Напишите конвейер для подсчета общего числа строк во всех текстовых файлах в
# указанной директории, используя find, xargs и wc
third_task() {
    SEARCH_DIR=$1

    # 1. find all files in the given dir
    find $SEARCH_DIR -type f | \
        # 2. for every found file in the given folder count amount of lines
        xargs wc -l
}

# Напишите конвейер, который использует команды df, sort и awk для мониторинга
# использования дискового пространства и записывает результаты в файл
# «disk_space_usage.txt».
fourth_task() {
    OUTPUT_FILE=disk_space_usage.txt

    # Stores used space percents, filesytem name and mounted information in the file
    df | awk '{ print $8, $1, $9 }' | \
        # Sorts by the used space
        sort -k 1 > \
        $OUTPUT_FILE
}

# Напишите конвейер, который использует команды cat, grep, awk, sort и tar для
# фильтрации строк с ключевым словом в лог-файлах, сортировки и архивации
# результатов.
fifth_task() {
    LOGS_FILE=$1
    FILTER_WORD=$2
    FILTERED_LOGS_FILE=filtered_logs.log
    LOGS_ARCHIVE=logs_archive.tar

    # 1. Getting content of the $LOGS_FILE
    cat $LOGS_FILE | \
        # 2. "Filtering" by the given word
        grep $FILTER_WORD | \
        # 3. Sort by "time" column
        sort -k 2 | \
        # 4. Save sorted log entries to the file
        awk '{ print $0 }' > "$FILTERED_LOGS_FILE"; \
        # 5. Archive file with sorted and filtered logs
        tar -cf "$LOGS_ARCHIVE" "$FILTERED_LOGS_FILE"
}

test() {
    echo "Ececuting $1"
    $2
}

test "first task" "first_task castlelecs nvim"
test "second task" "second_task dir1 dir2"
test "third task" "third_task dir1"
test "fourth task" fourth_task
test "fifth task" "fifth_task logs/today.log WARNING"
