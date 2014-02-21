# Usage
# =====
# ref: https://github.com/dlintw/mydocker/blob/master/ubuntu/duckbox/run.sh

FROM ubuntu:12.04
MAINTAINER Daniel YC Lin <dlin.tw at gmail>

RUN ln -sf /usr/share/zoninfo/Asia/Taipei /etc/localtime
RUN ln -sf bash /bin/sh
RUN apt-get update
# Bug? when upgrade, it occurs some package conflict error
#RUN apt-get upgrade

ADD inst_pkg.sh /tmp/inst_pkg.sh
RUN sh /tmp/inst_pkg.sh

RUN wget -O /tmp/fossil.zip \
  http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip \
  && unzip -d /usr/bin /tmp/fossil.zip && rm /tmp/fossil.zip

RUN mkdir /var/run/sshd && chmod 755 /var/run/sshd && start ssh
RUN echo 'root:root' | chpasswd

RUN mkdir -p /Archive /pdk7105-tdt

#RUN git clone https://github.com/dlintw/pdk7105-tdt
#RUN cd /pdk7105-tdt/tdt/cvs/cdk && ./make.sh 20 4 y 2 1 2 1 2

ADD build.sh /build.sh
#RUN make -j$((`nproc` + 1)) yaud-xbmc-nightly

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
