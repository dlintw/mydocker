# References
# ==========
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

RUN apt-get install -y rpm python-urlgrabber python-rpm python-sqlitecachec \
	python-libxml2

# let bash be sh
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN wget -O /tmp/install http://ftp.stlinux.com/pub/stlinux/2.4/install
RUN wget -O /tmp/dep.rpm http://download.stlinux.com/pub/stlinux/2.4/misc/stlinux24-host-STLinux_deps-20140120-1.i386.rpm
RUN rpm -ivh --force-debian /tmp/dep.rpm
RUN bash /tmp/install -u all-sh4-glibc
# cache file puts in /var/cache/yum/x86_64/6/STLinux_Distribution_Updates/packages/

RUN /opt/STM/STLinux-2.4/host/bin/stmyum update

RUN /opt/STM/STLinux-2.4/host/bin/stmyum clean dbcache packages
RUN yum clean packages dbcache
RUN rm -R /tmp/*

#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
#EXPOSE 22
