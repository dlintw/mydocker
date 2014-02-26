# References
# ==========
# http://stlinux.com/install/ubuntu

# Usage
# =====
# ref: https://github.com/dlintw/mydocker/blob/master/ubuntu/stlinux24/run.sh

FROM dlin/ubuntu-ssh

# let bash be sh
#RUN echo "dash dash/sh boolean false" | debconf-set-selections
#RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
RUN ln -sf bash /bin/sh
ADD inst_pkg.sh /tmp/inst_pkg.sh
RUN sh /tmp/inst_pkg.sh

RUN wget -O /tmp/fossil.zip http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip
RUN unzip -d /usr/bin /tmp/fossil.zip

RUN wget -O /tmp/install http://ftp.stlinux.com/pub/stlinux/2.4/install
RUN wget -O /tmp/dep.rpm http://download.stlinux.com/pub/stlinux/2.4/misc/stlinux24-host-STLinux_deps-20140120-1.i386.rpm
RUN rpm -ivh --force-debian /tmp/dep.rpm
RUN bash /tmp/install -u all-sh4-glibc
# cache file puts in /var/cache/yum/x86_64/6/STLinux_Distribution_Updates/packages/

RUN /opt/STM/STLinux-2.4/host/bin/stmyum update
RUN /opt/STM/STLinux-2.4/host/bin/stmyum clean dbcache packages
#RUN apt-get clean
#RUN rm -R /tmp/*

