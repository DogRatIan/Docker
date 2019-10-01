#! /bin/bash

name="dogratian/ubuntu18_joomla"
curr_dir=$(pwd)

echo "       Docker image: $name"

tag=`docker run --detach --rm \
    -p 8022:22 \
    -p 8080:80 \
    -p 8443:443 \
    --name joomla --hostname Joomla \
    --volume $curr_dir/www_data:/var/www \
    --volume $curr_dir/www_config:/etc/apache2 \
    --volume $curr_dir/php_config:/etc/php/7.2/apache2 \
    $name`
echo "TAG=$tag"

# Start services
docker exec -t $tag apachectl start

# Show ports
docker port $tag
