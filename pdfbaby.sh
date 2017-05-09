#!/bin/bash

#check the status of the last call
function err () {
    banner "MEEP MEEP!!"
    echo "Uh oh. $1"
    exit 1
}

function check_err {
    if [ $? -ne 0 ]
    then
        err "Something went wrong!"
    fi
}

if [ -z "$1" ]
then
    err "You didn't enter a file Silly!!"
fi

FILE=$1
BIB="FALSE"
if [ ! -z "$2" ]
then
    BIB=$2
fi

if [ -f "$FILE"".tex" ]
then
    pdflatex $FILE
    check_err

    if [ $BIB = "TRUE" ]
    then
        pdflatex $FILE
        check_err

        bibtex $FILE
        check_err

        pdflatex $FILE
        check_err
    fi
else
    err "That file doesn't exist silly!"
fi
