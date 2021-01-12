#!/bin/sh

case "$1" in
    start)
        echo '[-] Starting rasp-cloud'
        echo '[-] Waiting for Mongodb to start'
        while true
        do
            curl mongo:27017 &>/dev/null && break
            sleep 1
        done
        sleep 1
        echo '[-] Waiting for elasticsearch to start'
        while true
        do
            curl -I elasticsearch:9200 &>/dev/null && break
            sleep 1
        done
        /rasp/rasp-cloud -d
        echo '[-] rasp-cloud start success'
        sleep 5
        tail -f /rasp/logs/api/agent-cloud.log
    ;;
    stop)
        echo '[-] Stopping rasp-cloud'
        killall rasp-cloud
    ;;
    restart)
        $0 stop
        $0 start
    ;;
    *)
        echo Unknown action: $1
    ;;

esac