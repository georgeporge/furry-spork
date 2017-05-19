#!/bin/bash

#check the status of the last call
function err () {
    banner "MEEP MEEP!!"
    echo "Uh oh. $1" >&2
    exit 1
}

function check_err {
    if [ $? -ne 0 ]
    then
        err "Something went wrong!"
    fi
}


FILE=""
BIB="FALSE"
GLOSS="FALSE"
MESSAGE="Compiled document"

while getopts "bgf:" opt; do
    case $opt in
        b)
            BIB="TRUE"
            MESSAGE="$MESSAGE and bibliography"
            ;;
        f)
            FILE=$OPTARG
            ;;
        g)
            GLOSS="TRUE"
            MESSAGE="$MESSAGE and new glossary"
            echo GLOSS
            ;;
        \?)
            err "Invalid option -$OPTARG"
            ;;
    esac
done


if [ -z "$FILE" ]
then
    err "You didn't enter a file Silly!!"
fi

if [ -f "$FILE"".tex" ]
then
    if [ $GLOSS = "TRUE" ]
    then
        pdflatex $FILE
        check_err

        makeglossaries $FILE
        check_err
    fi

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

echo "$MESSAGE"
