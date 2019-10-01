#! /bin/bash

name="dogratian/ubuntu18_joomla"
echo "Building $name"

docker build -t $name .
docker images
