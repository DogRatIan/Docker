#! /bin/bash

# Prepare target env
IMAGE_NAME="dogratian/ubuntu16_xserver"
CONTAINER_HOSTNAME="xserver"

# Get the DISPLAY slot
DISPLAY_NUMBER=$(echo $DISPLAY | cut -d. -f1 | cut -d: -f2)
CONTAINER_DISPLAY=$DISPLAY_NUMBER

# Read container tag
if [ ! -e display/tag.txt ]
then
    echo "Container tag file not found."
    exit 1
fi
tag=`cat display/tag.txt`
echo TAG=$tag

# Check parameter
if [ "_$1" = "_" ]
then
    echo "Usage: $0 COMMAND"
    echo "Example: $0 xterm"
    exit 1
fi

# Proxy with the :0 DISPLAY
cmd="socat UNIX:/tmp/.X11-unix/X${CONTAINER_DISPLAY} UNIX-LISTEN:display/socket/X${CONTAINER_DISPLAY}"
echo $cmd
$cmd &

# Launch the container
cmd="docker exec -it -e DISPLAY=:${CONTAINER_DISPLAY} $tag $1"
echo $cmd
$cmd
