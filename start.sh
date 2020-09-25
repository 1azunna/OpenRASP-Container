#!/bin/bash

mongo_check () {
while true;
do
  curl mongo:27017
  if [ $? -eq 0 ]
  then 
    echo OK
    exit 0
  fi
done
}

elastic_check () {
while true;
do
  curl elasticsearch:9200
  if [ $? -eq 0 ]
  then 
    echo OK
    exit 0
  fi
done
}

mongo_check
elastic_check

./rasp-cloud -d


