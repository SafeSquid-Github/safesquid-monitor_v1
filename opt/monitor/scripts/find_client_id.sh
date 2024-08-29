#!/bin/bash

DLOG="/var/log/safesquid/native/safesquid.log"
# LOG=$2

MAIN () {
    ID=$1
    [ "x$2" == "x" ] && LOG="${DLOG}"

    [ "x$LOG" == "x" ] && echo "LOG file not specified" && exit 1

    [ ! -f $LOG ] && echo "$LOG not found" && exit 1

    Z="\[$ID\]";
    A='^.* ';
    B=$Z;  
    C='(.*(|\r\n))*(?<!\r)$';
    X=$A$B$C; 

    pcregrep -M -o -e "$X" $LOG
}


while true
do
    if read -t 1 INPUT
    then
        MAIN ${INPUT}
    else
        # No input, sleep for a bit to prevent high CPU usage
        sleep 1
    fi
done
