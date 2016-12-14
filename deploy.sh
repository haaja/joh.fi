#!/usr/bin/bash -e

RSYNC=/usr/bin/rsync
PATH_TO_DEPLOY="_site/"
USER="haaja"
HOST="lakka.kapsi.fi"
TARGET_DIR="/home/users/haaja/sites/joh.fi/www"

OPTIONS=(
    -avrc
    -e /usr/bin/ssh
    --progress
    --delete
    --exclude .well-known
    --exclude tt-rss
    --exclude php5.fcgi
    --exclude nextcloud
    --exclude .htaccess
)

$RSYNC ${OPTIONS[@]} $PATH_TO_DEPLOY $USER@$HOST:$TARGET_DIR
