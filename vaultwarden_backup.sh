#!/bin/bash
VWDIR="/root/docker-storage/vaultwarden/data"

# Formato data per il file
DATETIME="$(date +'%d-%m-%Y_%H-%M')"

# Nome directory backup
FOLDERPATH="$(date +'%d-%m-%Y')"

# Backup
BACKUP=vaultwarden-${DATETIME}.tar.gz

cd /tmp/

tar -Pczf $BACKUP $VWDIR

rclone copy $BACKUP remote:/Vaultwarden/${FOLDERPATH}/

rm $BACKUP