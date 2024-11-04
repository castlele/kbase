#!/bin/bash

function phone_book() {
    FILE_NAME="phone_book.lua"
    INPUT_FILE="phone_book_input.txt"
    FILES=$(cat $INPUT_FILE)

    lua $FILE_NAME $FILES
}

phone_book
