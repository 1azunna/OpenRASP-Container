#!/bin/bash

mongo_check () {
while true;
do
  curl -sS mongo:27017
  if [ $? -eq 0 ]
  then 
    echo OK
    break
  fi
done
}

elastic_check () {
while true;
do
  curl -sS elasticsearch:9200
  if [ $? -eq 0 ]
  then 
    echo OK
    break
  fi
done
}

mongo_check
elastic_check

./rasp-cloud -d


