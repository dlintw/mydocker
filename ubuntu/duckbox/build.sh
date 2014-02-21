# enable ssh login
pgrep sshd>/dev/null || /usr/sbin/sshd -D &
[ -d /pdk7105-tdt/.git ] || git clone https://github.com/dlintw/pdk7105-tdt
cd /pdk7105-tdt/tdt/cvs/cdk
[ -r Makefile ] || ./make.sh 20 4 y 2 1 2 1 2
git remote -v
git pull origin master
set -e
if ! make -j$((`nproc` + 1)) yaud-xbmc-nightly \
    |& tee -a make.`date +%y%m%d%H%M%S`.log ; then
  make -j$((`nproc` + 1)) yaud-xbmc-nightly \
  |& tee -a make.`date +%y%m%d%H%M%S`.log
fi
echo "OK rootfs: /pdk7105-tdt/tdt/tufsbox/release/"
T=/Archive/`date +%Y%m%d`.txz
tar -C /pdk7105-tdt/tdt/tufsbox/release/ -cJf $T .
ls -l $T
