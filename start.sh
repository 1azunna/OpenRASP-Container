#!/bin/bash

mongo_check () {
while true;
do
  curl -s mongo:27017
  if [ $? -eq 0 ];
  then 
    echo OK
    break
  fi
done
}

elastic_check () {
while true;
do
  curl -s elasticsearch:9200
  if [ $? -eq 0 ];
  then 
    echo OK
    break
  fi
done
}

mongo_check
elastic_check

./rasp-cloud -d
if [ $? -eq 0 ];
  then 
    sleep 30s
    ln -sf /dev/stdout /rasp/logs/api/agent-cloud.log
fi


