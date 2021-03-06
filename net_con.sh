#!/bin/bash
EMAIL=xxx@gmail.com
DEST=xxx@gmail.com
PW=xxx
scriptPy=./s_email.py


###
HOST=google.com

function check_online () {
    ping $HOST -c 1 -i .2 -t 60 > /dev/null 2>&1 && echo 1 || echo 0
}
foo=1
IS_ONLINE=$(check_online)

if [ $IS_ONLINE -eq 1 ]; then
    echo "online, sending ip"
    python3 $scriptPy $EMAIL $PW $DEST
fi

while [ 1 ]; do
    CHECKS=0
    while [ $IS_ONLINE -eq 1 ]; do
        sleep 10;
        IS_ONLINE=$(check_online)
        if [ $IS_ONLINE -eq 0 ]; then
            echo "offline"
            break
        fi
    done

    while [ $IS_ONLINE -eq 0 ]; do
        sleep 10;
        IS_ONLINE=$(check_online)
        CHECKS=$[CHECKS +1]
        if [ $IS_ONLINE -eq 1 ]; then
            echo "online, checks: $CHECK, sending ip"
            python3 $scriptPy $EMAIL $PW $DEST 
            break
        fi
    done;
done;

