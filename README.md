# OpenRASP-Container
Openrasp cloud management background (Translated-to-English)

## Pre-requisites

set the required environment variables to initialize both databases in your .env file
```
# MongoDB
MONGO_INITDB_ROOT_USERNAME=
MONGO_INITDB_ROOT_PASSWORD=
MONGO_INITDB_DATABASE=
MONGO_INITDB_USERNAME=
MONGO_INITDB_PASSWORD=
MONGO_REPLICA_SET_NAME=

# Elasticsearch
ELASTIC_USER=
ELASTIC_PASSWORD=
ELASTIC_ROOT_PASSWORD=
```

## Installation
To build the containers:
```
docker-compose build
```
To run the containers:
```
docker-compose up
```
## Tear down
```
docker-compose down -v --rmi all --remove-orphans
```

