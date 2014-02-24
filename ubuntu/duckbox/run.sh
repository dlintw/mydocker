# Usage: run.bat [image] [ssh_port]
[ `id -u` != 0 ] && echo "Err: should run as root" &&  exit 1
[ -d /Archive ] || mkdir /Archive
echo "Note:After enter docker containner, run '. /build.sh' to build"
img=${1:-dlin/ubuntu-duckbox}
if [ -n "$2" ] ; then
  port="-p $2:22"
else
  port="-p 22"
fi
id=`docker run -d -v /Archive:/Archive -v /tdt:/pdk7105-tdt $port $img /usr/sbin/sshd -D`
echo "default password is root, change it after login"
echo "ssh -p`docker port $id 22` root@localhost"
