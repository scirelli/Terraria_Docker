#!/usr/bin/env bash
worldName=${1:-'Doc Ock'}

docker rmi $(docker images -f "dangling=true" -q)
docker build \
    --build-arg TERRARIA_DOWNLOAD='https://terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-1404.zip' \
    --build-arg EXTRACTED_FOLDER_NAME='1404' \
    -t "scirelli/terraria:latest" \
    -t "scirelli/terraria:1.4.0.4" .
