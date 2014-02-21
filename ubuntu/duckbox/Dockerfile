# Usage
# =====
# ref: https://github.com/dlintw/mydocker/blob/master/ubuntu/duckbox/run.sh

FROM dlin/ubuntu-ssh
RUN ln -sf bash /bin/sh
ADD inst_pkg.sh /tmp/inst_pkg.sh
RUN sh /tmp/inst_pkg.sh

RUN wget -O /tmp/fossil.zip \
  http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip \
  && unzip -d /usr/bin /tmp/fossil.zip && rm /tmp/fossil.zip

RUN mkdir -p /Archive /pdk7105-tdt
ADD build.sh /build.sh
