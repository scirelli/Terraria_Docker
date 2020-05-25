#!/usr/bin/env bash

docker rmi $(docker images -f "dangling=true" -q)
docker build -t "scirelli/terraria:latest" .
