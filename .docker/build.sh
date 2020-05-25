#!/usr/bin/env bash
worldName=${1:-'Doc Ock'}

docker rmi $(docker images -f "dangling=true" -q)
docker build \
    --build-arg TERRARIA_WORLD_NAME="$worldName" \
    -t "scirelli/terraria:latest" .
