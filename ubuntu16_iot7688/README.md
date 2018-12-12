# Docker image
You can use this docker image to build the OpenWRT system for IOT7688 module.

The image is published at Docker Hub.

https://hub.docker.com/r/dogratian/ubuntu16_iot7688/

# Build OpenWRT with docker
1. Create a working directory and download the "start_container.sh" to there. For example "~/working/iot7688".

1. Use the "start_container.sh" to start the docker container. It will map the directory "working" on the current directory into the container. You will see the tag of the container and you need it to execute those commands when building the system.
```
$ ./start_container.sh
       Docker image: dogratian/ubuntu16_iot7688
     Host workspace: /home/dogratian/working/iot7688/working
Container workspace: /home/dogratian/working
TAG=93c1ec7818dadd402f4bb2513f059d62c5c8bb8cdd34d23b3a65e829c0f68106
$ 
```

2. Run the following commands to clone the source code to "working".
```
git clone https://github.com/DogRatIan/IOT7688.git working
```

3. Run the following commands to update feed packages. Replace the &lt;TAG&gt; the tag id of your container.
```
docker exec -t <TAG> sh -c "cd openwrt && ./scripts/feeds update -i"
docker exec -t <TAG> sh -c "cd openwrt && ./scripts/feeds install node openssh-server-pam ntpdate mtk-sdk-wifi"
docker exec -t <TAG> sh -c "cd openwrt && ./scripts/feeds install snmpd"
docker exec -t <TAG> sh -c "cd openwrt && ./scripts/feeds install evtest i2c-tools"
```

4. Restore .config file.
```
docker exec -t <TAG> sh -c "cd openwrt && git checkout .config"
``` 

5. Start the build process. It may take an hour to finish.
```
docker exec -t <TAG> sh -c "cd openwrt && make V=s"
```

6. When done, a image file called "lks7688.img" will generated at "working/openwrt/bin/ramips".

# Build uboot with Docker
1. Create a working directory and download the "start_container.sh" to there. For example "~/working/iot7688".

1. Use the "start_container.sh" to start the docker container. It will map the directory "working" on the current directory into the container. You will see the tag of the container and you need it to execute those commands when building the system.
```
$ ./start_container.sh
       Docker image: dogratian/ubuntu16_iot7688
     Host workspace: /home/dogratian/working/iot7688/working
Container workspace: /home/dogratian/working
TAG=93c1ec7818dadd402f4bb2513f059d62c5c8bb8cdd34d23b3a65e829c0f68106
$ 
```

3. Run the following commands to ready the complier. Replace the &lt;TAG&gt; the tag id of your container.
```
docker exec -t <TAG> sh -c "cd uboot && tar -xvjf buildroot-gcc342.tar.bz2 -C /opt/"
```

4. Start the build process.
```
docker exec -t <TAG> sh -c "cd uboot && make"
```

5. When done, a image file called "lks7688.ldr" will generated.