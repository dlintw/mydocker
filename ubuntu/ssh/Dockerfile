# Usage
# =====
# # assume /tmp/root is your shared directory with this docker
# # assume 20022 is your ssh port for this docker, password: root
# docker run -d -v /tmp/root:/root -p 20022:22 dlin/ubuntu-ssh /usr/sbin/sshd -D
# ssh -p 20022 root@localhost

#FROM stackbrew/ubuntu:12.04
FROM racker/precise-with-updates
MAINTAINER Daniel YC Lin <dlin.tw at gmail>

# original /etc/apt/sources.list
# deb http://archive.ubuntu.com/ubuntu precise main universe
# deb http://archive.ubuntu.com/ubuntu precise-updates main universe
# deb http://archive.ubuntu.com/ubuntu precise-security main universe

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > \
#  /etc/apt/sources.list && apt-get update && apt-get -y upgrade
RUN apt-get update && apt-get -y upgrade

RUN ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN apt-get install -y zip unzip openssh-server
RUN mkdir /var/run/sshd && chmod 755 /var/run/sshd && start ssh
RUN echo 'root:root' | chpasswd

#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
