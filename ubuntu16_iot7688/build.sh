#! /bin/bash

name="dogratian/ubuntu16_iot7688"
echo "Building $name"

docker build -t $name .
docker images
