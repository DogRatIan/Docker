#! /bin/bash

name="dogratian/ubuntu16_iot7688"
pwd=$(pwd)
host_workspace="$pwd/working"
container_workspace="/home/dogratian/working"

echo "       Docker image: $name"
echo "     Host workspace: $host_workspace"
echo "Container workspace: $container_workspace"

if [ ! -e $host_workspace ]
then
    mkdir $host_workspace
fi

tag=`docker run -d --rm -P -t -u 1000:1000 -w $container_workspace -v $host_workspace:$container_workspace:rw,z $name cat`
echo "TAG=$tag"
docker exec -it $tag chown 1000:1000 /home/dogratian -R
