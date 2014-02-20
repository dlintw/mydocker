[ `id -u` != 0 ] && echo "Err: should run as root" &&  exit 1
[ -d /Archive ] || mkdir /Archive
echo "Note:After enter docker containner, run '. /build.sh' to build"
#docker run -t -i -v /Archive:/Archive -v /tdt:/pdk7105-tdt -p 20022:22 dlin/ubuntu-duckbox /bin/bash
docker run -d -v /Archive:/Archive -v /tdt:/pdk7105-tdt -p 20022:22 ${1:-dlin/ubuntu-duckbox}
echo "default password is root, change it after login"
echo "ssh -p20022 root@localhost"
