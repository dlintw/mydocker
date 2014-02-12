# References
# ==========
# dockerfile ref: http://docs.docker.io/en/latest/use/builder/
# command usage ref: http://docs.docker.io/en/latest/commandline/cli/
# http://docs.docker.io/en/latest/use/port_redirection/#port-redirection
# http://stlinux.com/install/ubuntu

# Usage
# =====
# # assume /tmp/root is your shared directory with this docker
# # assume 20022 is your ssh port for this docker, password: root
# docker run -d -v /tmp/root:/root -p 20022:22 dlin/ubuntu-stlinux24
# ssh -p 20022 root@localhost

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

RUN apt-get install -y rpm python-urlgrabber python-rpm python-sqlitecachec

RUN ln -sf bash /bin/sh
RUN wget -O /tmp/install http://ftp.stlinux.com/pub/stlinux/2.4/install
#RUN sh /tmp/install || true
RUN bash /tmp/install -d all-sh4-glibc
# cache file puts in /var/cache/yum/x86_64/6/STLinux_Distribution_Updates/packages/

RUN /opt/STM/STLinux-2.4/host/bin/stmyum clean dbcache packages

RUN yum clean packages dbcache
RUN rm -R /tmp/*
