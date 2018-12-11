# Ubuntu16 + XServer

## Start the container
```
$ ./start_container.sh
```
After container started, a directory called "display" will be created to store temporary files.

## Run xterm
If you connect the docker host via SSH, run the following scripts.
```
$ ./xauth_add.sh
$ ./ssh_exec.sh xterm
```

If you are at the docker host, run the following script.
```
$ ./local_exec.sh xterm
```

# Credits
The content of Dockerfile is reference from Jean-Tiare Le Bigot's blog:

https://blog.yadutaf.fr/2017/09/10/running-a-graphical-app-in-a-docker-container-on-a-remote-server/