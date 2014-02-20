# enable ssh login
pgrep sshd>/dev/null || /usr/sbin/sshd -D &
[ -d /pdk7105-tdt/.git ] || git clone https://github.com/dlintw/pdk7105-tdt
cd /pdk7105-tdt/tdt/cvs/cdk
[ -r Makefile ] || ./make.sh 20 4 y 2 1 2 1 2
git remote -v
git pull
make -j$((`nproc` + 1)) yaud-xbmc-nightly \
  |& tee -a make.`date +%y%m%d%H%M%S`.log
