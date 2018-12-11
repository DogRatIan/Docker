#! /bin/bash

name="dogratian/ubuntu16_xserver"
echo "Building $name"

docker build -t $name .
docker images
