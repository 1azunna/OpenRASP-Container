#!/bin/bash

curl -XPUT -u elastic:changeme 'localhost:9200/_xpack/security/user/elastic/_password?pretty' -H 'Content-Type: application/json' -d'
{
  "password": \"$ELASTIC_ROOT_PASSWORD\"
}
'
bin/elasticsearch-users useradd $ELASTIC_USER -p $ELASTIC_PASSWORD -r reporting_user,remote_monitoring_agent,monitoring_user,ingest_admin