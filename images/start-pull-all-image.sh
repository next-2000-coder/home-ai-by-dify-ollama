#!/bin/bash

IMAGES=(
"busybox:1.37.0"
"bitnami/redis:7.4.1"
"langgenius/dify-api:0.10.1"
"langgenius/dify-web:0.10.1"
"langgenius/dify-sandbox:0.2.10"
"nginx:1.27.2"
"ollama/ollama:0.3.14"
"postgres:15-alpine"
"semitechnologies/weaviate:1.19.0"
"ubuntu/squid:6.6-24.04_edge"
)

for item in "${IMAGES[@]}"; do
  echo "start pull ${item}"
  ./pull-image.sh "${item}"
done
