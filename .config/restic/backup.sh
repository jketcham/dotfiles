#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Path to env file required'
    exit 0
fi

source $1

# -r sftp:jack@nas:/mnt/storage/backups/coconino

restic backup ~/ --exclude-file=/home/jack/.config/restic/ignorefiles
