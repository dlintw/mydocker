[ `id -u` != 0 ] && echo "Err: should run as root" &&  exit 1
[ -d /Archive ] || mkdir /Archive
docker run -t -i -v /Archive:/Archive -p 20022:22 dlin/ubuntu-duckbox /bin/bash
