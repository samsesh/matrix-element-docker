#!/bin/bash
eval $(cat .env | sed 's/^/export /')
docker run -it --rm \
    --mount type=volume,src=synapse-data,dst=/data \
    -e SYNAPSE_SERVER_NAME=${HOSTNAME} \
    -e SYNAPSE_REPORT_STATS=yes \
    matrixdotorg/synapse:latest generate

mkdir synapse-data
mv  /var/lib/docker/volumes/synapse-data/_data/ synapse-data
docker volume rm synapse-data/
mkdir element-web-config
cd element-web-config
wget https://raw.githubusercontent.com/dustinbrun/docker-compose-homeserver/main/matrix-extensions/element-web-config/config.json