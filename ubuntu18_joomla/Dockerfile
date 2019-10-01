FROM ubuntu:18.04

# Update and install packages
ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt -y install apt-utils && apt -y upgrade
RUN apt -y install openssh-server net-tools gawk python2.7 vim
RUN apt -y install apache2 php libapache2-mod-php php-mysql php-xml php-soap php-xmlrpc php-mbstring php-json php-gd php-zip
RUN apt -y clean

# Allow root login ssh
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && echo "root:root" | chpasswd

# Prepare extra files
RUN mkdir /var/run/sshd
#COPY extra_files/_vimrc /root

# Setup docker options
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
