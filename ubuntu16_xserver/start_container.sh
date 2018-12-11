#! /bin/bash

name="dogratian/ubuntu16_xserver"
pwd=$(pwd)
host_workspace="$pwd/workspace"
container_workspace="/home/dogratian/workspace"

rm -Rf display
mkdir -p display/socket

echo "       Docker image: $name"
#echo "     Host workspace: $host_workspace"
#echo "Container workspace: $container_workspace"

tag=`docker run -d --rm -P -t \
    -v ${PWD}/display/socket:/tmp/.X11-unix \
    --hostname xserver \
    $name`
echo "TAG=$tag"
docker exec -it $tag chown 1000:1000 /home/dogratian -R
docker port $tag
echo $tag > display/tag.txt
