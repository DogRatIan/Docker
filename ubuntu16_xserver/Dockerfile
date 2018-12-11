FROM ubuntu:16.04

# Update and install packages
ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install apt-utils && apt-get -y upgrade
RUN apt-get -y install openssh-server net-tools sudo
RUN apt-get -y install xorg xterm
RUN apt-get -y clean

# Allow root login ssh
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && echo "root:root" | chpasswd

# Create a default user
RUN adduser --disabled-password --gecos "" dogratian && echo "dogratian:123456" | chpasswd && chown 1000:1000 /home/dogratian -R && usermod -a -G sudo dogratian

# Prepare extra files
RUN mkdir /var/run/sshd && chgrp 1000 /opt && chmod g+w /opt
RUN touch /root/.Xauthority && touch /home/dogratian/.Xauthority

#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile

# Setup docker options
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
