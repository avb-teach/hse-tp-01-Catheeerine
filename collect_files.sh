#!/bin/bash
main() {

    for file in "$1"/* #https://habr.com/ru/companies/ruvds/articles/325928/
    do

    if [ -d "$file" ]
    then
    main "$file" "$2"  

    elif [ -f "$file" ]
    then
    fullname="$(basename "$file")"
    firstpart="${fullname%.*}"
    secondpart="${fullname##*.}"

    numberoffiles=0

    while [ -e "$2/$fullname" ]
    do
    numberoffiles=$((numberoffiles + 1))
    fullname="${firstpart}${numberoffiles}.${secondpart}"
    done
    
    cp "$file" "$2/$fullname"
    fi
    done
}

main "$1" "$2"
