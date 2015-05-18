#!/bin/sh
# Set the variable below to the ping timeout value
# In *BSD, this is given in milliseconds
# In Linux, try "1"
timeout=500
while :; do
    ping -W $timeout -c 1 "$@" | grep 'bytes from '
    case $? in
        0 ) sleep 1 ;;
        1 ) echo -e "request timeout" ;;
        * ) exit ;;
    esac
done
