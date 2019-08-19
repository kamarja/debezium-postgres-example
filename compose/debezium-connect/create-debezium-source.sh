#!/usr/bin/env bash

echo 'Wait a bit for the other services to come up.'
sleep 60

echo 'Creating source'

curl -X POST "Accept:application/json" -H "Content-Type:application/json" connect:8083/connectors/ -d '{
  "name": "products-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "postgres",
    "database.password": "postgres",
    "database.dbname" : "postgres",
    "plugin.name": "wal2json",	
    "slot.name": "wal2json_rds1",	
    "snapshot.mode": "always",
    "database.server.name": "dbserver1",
    "database.history.kafka.bootstrap.servers": "kafka:9092",
    "database.history.kafka.topic": "products",
    "table.whitelist": "inventory.products"
  }
}'
