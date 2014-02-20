# Usage: run.bat [image] [ssh_port]
[ `id -u` != 0 ] && echo "Err: should run as root" &&  exit 1
[ -d /Archive ] || mkdir /Archive
echo "Note:After enter docker containner, run '. /build.sh' to build"
img=${1:-dlin/ubuntu-duckbox}
port=${2:-20022}
#docker run -t -i -v /Archive:/Archive -v /tdt:/pdk7105-tdt -p $port:22 $img /bin/bash
docker run -d -v /Archive:/Archive -v /tdt:/pdk7105-tdt -p $port:22 $img
echo "default password is root, change it after login"
echo "ssh -p$port root@localhost"
