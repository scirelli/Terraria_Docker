#!/usr/bin/env bash
set -o errexit -o pipefail -o noclobber -o nounset

TERRARIA_SAVES_HOME=/home/daddy/.local/share/Terraria
timestamp=$(/usr/bin/date "+%Y.%m.%d-%H.%M.%S")
BACKUP_FILE=/tmp/terraria_${timestamp}.tar.gz

tar -czvf $BACKUP_FILE $TERRARIA_SAVES_HOME
echo "$BACKUP_FILE"
#scp $BACKUP_FILE rpi0w-playground.cirelli.lan:~/TerrariaB/
rsync --progress -h $BACKUP_FILE backups@172.16.0.20:/media/Data5/terraria/
