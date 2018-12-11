#! /bin/bash

# Prepare target env
CONTAINER_HOSTNAME="xserver"

# Get the DISPLAY slot
DISPLAY_NUMBER=$(echo $DISPLAY | cut -d. -f1 | cut -d: -f2)
CONTAINER_DISPLAY=$DISPLAY_NUMBER

# Extract current authentication cookie
AUTH_COOKIE=$(xauth list | grep "^$(hostname)/unix:${DISPLAY_NUMBER} " | awk '{print $3}')
echo AUTH_COOKIE=${AUTH_COOKIE}

# Read container tag
if [ ! -e display/tag.txt ]
then
    echo "Container tag file not found."
    exit 1
fi
tag=`cat display/tag.txt`
echo TAG=$tag

#
cmd="docker exec -t ${tag} xauth add ${CONTAINER_HOSTNAME}/unix:${CONTAINER_DISPLAY} MIT-MAGIC-COOKIE-1 ${AUTH_COOKIE}"
echo $cmd
$cmd

