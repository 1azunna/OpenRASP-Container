#!/bin/bash

bin/elasticsearch-setup-passwords auto
bin/elasticsearch-users useradd $ELASTIC_USER -p $ELASTIC_PASSWORD -r reporting_user,remote_monitoring_agent,monitoring_user,ingest_admin