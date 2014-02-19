# enable ssh login
pgrep sshdx>/dev/null && /usr/sbin/sshd -D &
cd /pdk7105-tdt/tdt/cvs/cdk
git remote -v
git pull
make -j$((`nproc` + 1)) yaud-xbmc-nightly \
  |& tee -a make.`date +%y%m%d%H%M%S`.log
