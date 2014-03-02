# enable ssh login
repo=https://github.com/dlintw/pdk7105-tdt
pgrep sshd>/dev/null || /usr/sbin/sshd -D &
cd /
[ -d /tdt/.git ] || git clone $repo tdt
[ -d $HOME/Archive ] || ln -s /Archive $HOME/Archive

cd /tdt/tdt/cvs/cdk
git remote -v
git pull origin master

[ -r Makefile ] || ./make.sh 20 4 y 2 1 2 1 2
[ ! -r Makefile ] && exit 1
L="$PWD/make.`date +%y%m%d%H%M%S`.log" ; touch $L ; tail -f $L &
make -j$((`nproc` + 1)) yaud-xbmc-nightly >> $L 2>&1
if [ $? != 0 ] ; then
  echo "***** make in multi-thread failed, check $L"
  #tail -20 $L
  L="$PWD/make.`date +%y%m%d%H%M%S`.log" ; touch $L ; tail -f $L &
  make yaud-xbmc-nightly >> $L 2>&1
  if [ $? != 0 ] ; then
    #tail -20 $L
    echo "***** make in single-thread failed, check $L"
    exit 1
  fi
fi
echo "OK rootfs: /tdt/tdt/tufsbox/release/"
T=$HOME/Archive/`date +%Y%m%d`.txz
tar -C /tdt/tdt/tufsbox/release/ -cJf $T .
ls -l $T
# vim:et sw=2 ts=2 ai:
