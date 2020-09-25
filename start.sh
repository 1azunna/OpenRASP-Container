#!/bin/bash
set -x
pid=0

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

# SIGUSR1-handler
my_handler() {
  echo "my_handler"
}

# SIGTERM-handler
term_handler() {
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers
# on callback, kill the last background process, which is `tail -f /dev/null` and execute the specified handler
trap 'kill ${!}; my_handler' SIGUSR1
trap 'kill ${!}; term_handler' SIGTERM

./rasp-cloud -d & 
pid="$!"
if [ $? -eq 0 ];
  then 
    sleep 10s
    ln -sf /dev/stdout /rasp/logs/api/agent-cloud.log
fi

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done