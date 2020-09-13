#!bin/bash

./rasp-coud -d
#check if the log file exists
FILE=/rasp/logs/api/agent-cloud.log
if [ -f "$FILE" ]; then
        # Forward agent logs to docker log collector
    ln -sf /dev/stdout /rasp/logs/api/agent-cloud.log;
else 
    mkdir /rasp/logs/api && touch agent-cloud.log
fi