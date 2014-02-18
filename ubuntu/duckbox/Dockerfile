# Usage
# =====
# mkdir -p /Archive # for keep downloaded sources
# docker run -t -i -v /Archive:/Archive dlin/ubuntu-duckbox /bin/bash
# cd /pdk7105-tdt/tdt/cvs/cdk 
# git pull && git checkout pdk7150
# # Assume you have 4 cpu cores, assign 5(=4+1) jobs to build.
# make -j5 yaud-xbmc-nightly
# In the REVISIONS menu, choose 5)Frodo_rc3

FROM ubuntu:12.04
MAINTAINER Daniel YC Lin <dlin.tw at gmail>

RUN ln -sf /usr/share/zoninfo/Asia/Taipei /etc/localtime
RUN ln -sf bash /bin/sh
RUN apt-get update
#RUN apt-get upgrade

RUN apt-get install -y git unzip subversion openssh-server gcc g++ make \
  libreadline-dev unzip gettext libtool automake autoconf \
  flex bison libglib2.0-dev zlib1g-dev texinfo rpm bzip2 libncurses5-dev \
  ccache gawk fakeroot xfslibs-dev swig pkg-config \
  autopoint ruby cmake doxygen default-jdk

RUN wget -O /tmp/fossil.zip \
  http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip \
  && unzip -d /usr/bin /tmp/fossil.zip && rm /tmp/fossil.zip

RUN mkdir /var/run/sshd
RUN /etc/init.d/ssh start
RUN echo 'root:root' | chpasswd

RUN mkdir /Archive

# old method
#RUN git clone https://git.gitorious.org/open-duckbox-project-sh4/tdt.git
#WORKDIR tdt/tdt/cvs/cdk
#RUN sed -i -e 's,ftp://,http://,' rules-archive

# extra required packages
# /Archive/pcre-8.30.tar.bz2 http://ftp.cs.stanford.edu/pub/exim/pcre/pcre-8.30.tar.bz2
# /Archive/tinyxml_2_6_2.tar.gz http://download.sf.net/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz

RUN git clone https://github.com/dlintw/pdk7105-tdt && cd /pdk7105-tdt \
  && git checkout pdk7105
RUN cd /pdk7105-tdt/tdt/cvs/cdk && ./make.sh 20 4 y 2 1 2 1 2

#RUN make -j$((`nproc` + 1)) yaud-xbmc-nightly

#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
#EXPOSE 22
