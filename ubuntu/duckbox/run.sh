[ `id -u` != 0 ] && echo "Err: should run as root" &&  exit 1
[ -d /Archive ] || mkdir /Archive
cat Dockerfile
docker run -t -i -v /Archive:/Archive dlin/ubuntu-duckbox /bin/bash
