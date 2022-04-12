#!/bin/bash
docker run -it --rm \
    --mount type=volume,src=synapse-data,dst=/data \
    -e SYNAPSE_SERVER_NAME=my.matrix.host \
    -e SYNAPSE_REPORT_STATS=yes \
    matrixdotorg/synapse:latest generate

mkdir synapse-data
mv  /var/lib/docker/volumes/synapse-data/_data/ synapse-data
docker volume rm synapse-data/