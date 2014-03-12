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

RUN apt-get update -y ; apt-get upgrade -y

RUN wget -q -O /tmp/fossil.zip http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip ; \
  unzip -d /usr/bin /tmp/fossil.zip

RUN wget -q -O /tmp/install http://ftp.stlinux.com/pub/stlinux/2.4/install ; \
  wget -q -O /tmp/dep.rpm http://download.stlinux.com/pub/stlinux/2.4/misc/stlinux24-host-STLinux_deps-20140120-1.i386.rpm ; \
  rpm -ivh --force-debian /tmp/dep.rpm

# 2014/03/12 workaround for stmyum update fail problem
RUN cd /tmp ; \
  wget -q http://www.stlinux.com/pub/stlinux/2.4/updates/RPMS/host/stlinux24-host-kernel-source-sh4-2.6.32.61_stm24_0212-212.noarch.rpm ; \
  wget -q http://download.stlinux.com/pub/stlinux/2.4/STLinux/host/stlinux24-host-filesystem-1.0-7.noarch.rpm ; \
  rpm -Uvh stlinux24-host-kernel-source-sh4-2.6.32.61_stm24_0212-212.noarch.rpm stlinux24-host-filesystem-1.0-7.noarch.rpm

RUN bash /tmp/install -u all-sh4-glibc
# cache file puts in /var/cache/yum/x86_64/6/STLinux_Distribution_Updates/packages/

RUN /opt/STM/STLinux-2.4/host/bin/stmyum update -y
#RUN /opt/STM/STLinux-2.4/host/bin/stmyum clean dbcache packages
#RUN apt-get clean
RUN rm -R /tmp/*
