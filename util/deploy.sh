#!/bin/bash

# Script to deploy the riemann rules to the server and reload the streams.

RIEMANN_CFG_DIR=/usr/local/etc/riemann
RIEMANN_LIB_DIR=$RIEMANN_CFG_DIR/lib

RSYNC_CMD=$(which rsync)
RSYNC_OPTS="--verbose --recursive --delete"

if [[ -z "$RSYNC_CMD" ]]; then
    echo "Unable to locate rsync command!" >&2
    exit 1
fi

RIEMANN_HOST=${1:-riemann}

echo "Deploying riemann stream configuration to $RIEMANN_HOST"

scp config.clj $RIEMANN_HOST:$RIEMANN_CFG_DIR/riemann.config
$RSYNC_CMD $RSYNC_OPTS src/ $RIEMANN_HOST:$RIEMANN_LIB_DIR
ssh $RIEMANN_HOST "service riemann status && sudo kill -s HUP \`sudo cat /var/run/riemann/riemann.pid\` || sudo service riemann start"
