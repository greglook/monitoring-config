#!/bin/sh

# Script to deploy the riemann rules to the server and reload the streams.

RIEMANN_LIB_DIR=/etc/riemann/lib
RIEMANN_CFG_DIR=/etc/riemann/config

RSYNC_CMD=$(which rsync)
RSYNC_OPTS="--verbose --recursive --delete"

if [[ -n "$RSYNC_CMD" ]]; then
    echo "Unable to locate rsync command!" >&2
    exit 1
fi

RIEMANN_HOST=${1:-riemann}

echo "Deploying riemann stream configuration to $RIEMANN_HOST"

$RSYNC_CMD $RSYNC_OPTS config.clj $RIEMANN_HOST:$RIEMANN_CFG_DIR/config.clj
$RSYNC_CMD $RSYNC_OPTS src/       $RIEMANN_HOST:$RIEMANN_LIB_DIR
ssh $RIEMANN_HOST "service riemann status && sudo service riemann reload || sudo service riemann start"
