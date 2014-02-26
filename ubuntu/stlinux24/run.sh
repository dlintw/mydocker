if [ $# -eq 0 ] ;then
  cat <<EOF
Usage 1: run.sh ssh [image] [ssh_port]
Usage 2: run.sh build [image] [ssh_port] # automatically build all
EOF
  exit 0
fi

if  ! groups | grep '\bdocker\b' >/dev/null && [ `id -u` != 0 ] ; then
  echo "Err: should run as root or in group 'docker'" &&  exit 1
fi
[ -d /Archive ] || mkdir /Archive
[ -d /tdt ] || mkdir /tdt


img=${2:-dlin/ubuntu-stlinux24}
if [ -n "$3" ] ; then
  port="-p $3:22"
else
  port="-p 22"
fi
set -x
if [ "$1" = build ] ; then
  docker run -t -i -v /Archive:/Archive -v /tdt:/pdk7105-tdt $port $img bash
elif [ "$1" = ssh ] ; then
  id=`docker run -d -v /Archive:/Archive -v /tdt:/pdk7105-tdt $port $img /usr/sbin/sshd -D`
  echo "default password is root, change it after login"
  echo "ssh -p`docker port $id 22` root@localhost"
else
  echo "Err: invalid option $1"
  exit 1
fi

# vim:et sw=2 ts=2 ai:
