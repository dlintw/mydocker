# Usage
# =====
# # assume /tmp/root is your shared directory with this docker
# # assume 20022 is your ssh port for this docker, password: root
# docker run -d -v /tmp/root:/root -p 20022:22 dlin/centos-ssh
# ssh -p 20022 root@localhost

FROM centos:6.4
MAINTAINER Daniel YC Lin <dlin.tw at gmail>

# if want to force use Taiwan mirror
# ref: http://www.phcno1.net/modules/tad_book3/page.php?tbdsn=538

RUN yum update -y
ADD localtime /etc/localtime

RUN yum install -y git unzip subversion openssh-server gcc-c++ make readline-devel which unzip

RUN wget -O /tmp/fossil.zip http://www.fossil-scm.org/download/fossil-linux-x86-20140127173344.zip
RUN unzip -d /usr/bin /tmp/fossil.zip && rm /tmp/fossil.zip

RUN /etc/init.d/sshd start
RUN echo 'root:root' | chpasswd
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
