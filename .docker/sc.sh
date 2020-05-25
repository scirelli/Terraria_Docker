#!/usr/bin/env bash

ARGs="$@"
logfile=/var/logs/terraria/game.log

echo $ARGs

screen -dmS terraria /bin/bash -c "terraria -config /etc/terraria/serverconfig.txt $ARGs >$logfile 2>&1"

tail -f $logfile
