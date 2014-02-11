# dockerfile ref: http://docs.docker.io/en/latest/use/builder/
# command usage ref: http://docs.docker.io/en/latest/commandline/cli/
# http://docs.docker.io/en/latest/use/port_redirection/#port-redirection

# docker build -t dlin/centos
# docker -t -i -v /opt/tmp1:/tmp:rw dlin/centos  /bin/bash
# docker -v /opt/tmp1:/tmp:rw -p 127.0.0.1:8888:8888 -p 127.0.0.1::20022:22 dlin/centos /usr/sbin/sshd -D

FROM centos:6.4
MAINTAINER Daniel YC Lin <dlin.tw at gmail>

# if want to force use Taiwan mirror
# ref: http://www.phcno1.net/modules/tad_book3/page.php?tbdsn=538

RUN yum update -y
ADD localtime /etc/localtime

RUN yum install -y git unzip subversion openssh-server gcc-c++ make readline-devel which unzip

RUN wget -O /tmp/fossil.zip http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip
RUN unzip -d /usr/bin /tmp/fossil.zip

RUN /etc/init.d/sshd start
RUN echo 'root:root' | chpasswd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22

RUN wget -O /tmp/install http://ftp.stlinux.com/pub/stlinux/2.4/install
#RUN sh /tmp/install || true
RUN sh /tmp/install all-sh4-glibc
# cache file puts in /var/cache/yum/x86_64/6/STLinux_Distribution_Updates/packages/

RUN yum clean packages dbcache
RUN /opt/STM/STLinux-2.4/host/bin/stmyum clean dbcache packages
RUN rm -R /tmp/*
