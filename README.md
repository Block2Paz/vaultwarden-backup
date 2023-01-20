<h1 align="center">Vaultwarden Backup</h1>

<p align="center">Script for vaultwarden backup</p>

#### Script
```bash
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
```

#### Crontab
```bash
0 */4 * * * /root/docker-storage/vaultwarden/vaultwarden_backup.sh
```