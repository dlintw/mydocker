# dockerfile ref: http://docs.docker.io/en/latest/use/builder/
# command usage ref: http://docs.docker.io/en/latest/commandline/cli/
# http://docs.docker.io/en/latest/use/port_redirection/#port-redirection

# docker build -t dlin/centos
# docker -t -i -v /opt/tmp1:/tmp:rw dlin/centos  /bin/bash
# docker -v /opt/tmp1:/tmp:rw -p 127.0.0.1:8888:8888 -p 127.0.0.1::20022:22 dlin/centos /usr/sbin/sshd -D

FROM ubuntu:12.04
MAINTAINER Daniel YC Lin <dlin.tw at gmail>

RUN apt-get update
ADD localtime /etc/localtime

RUN apt-get install -y git unzip subversion openssh-server gcc g++ make libreadline-dev unzip

RUN wget -O /tmp/fossil.zip http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip
RUN unzip -d /usr/bin /tmp/fossil.zip

RUN mkdir /var/run/sshd
RUN /etc/init.d/ssh start
RUN echo 'root:root' | chpasswd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
