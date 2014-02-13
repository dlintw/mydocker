# Usage
# =====
# # assume /tmp/root is your shared directory with this docker
# # assume 20022 is your ssh port for this docker, password: root
# docker run -d -v /tmp/root:/root -p 20022:22 dlin/ubuntu-ssh
# ssh -p 20022 root@localhost


FROM ubuntu:12.04
MAINTAINER Daniel YC Lin <dlin.tw at gmail>

RUN apt-get update
ADD localtime /etc/localtime

RUN apt-get install -y git unzip subversion openssh-server gcc g++ make libreadline-dev unzip

RUN wget -O /tmp/fossil.zip http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip
RUN unzip -d /usr/bin /tmp/fossil.zip && rm /tmp/fossil.zip

RUN mkdir /var/run/sshd
RUN /etc/init.d/ssh start
RUN echo 'root:root' | chpasswd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
