#!/bin/bash
docker import http://buildlogs.centos.org/centos/7/docker/CentOS-7-20140625-x86_64-docker_01.img.tar.xz centos7
docker run -t -i centos7 /bin/bash
# vim:et sw=2 ts=2 ai nocp sta

