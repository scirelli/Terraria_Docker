#!/usr/bin/env bash

TERRARIA_PASSWORD=${1:-$TERRARIA_PASSWORD}
TERRARIA_PASSWORD=${TERRARIA_PASSWORD:-'passw0rd'}
TERRARIA_WORLD_SAVES_DIR=${1:-'/tmp/worlds'}
TERRARIA_LOGS_DIR=${2:-'/tmp/logs'}

docker run --rm \
    --name Terraria_Docker \
    --detach \
    -P \
    --volume $TERRARIA_WORLD_SAVES_DIR:/var/terraria/worlds \
    --volume $TERRARIA_LOGS_DIR:/var/logs/terraria \
    scirelli/terraria:latest -password $TERRARIA_PASSWORD -world /var/terraria/worlds/MyDockerWorld.wld -worldname MyDockerWorld
