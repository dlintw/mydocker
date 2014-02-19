# enable ssh login
pgrep sshdx>/dev/null && /usr/sbin/sshd -D &
cd /pdk7105-tdt/tdt/cvs/cdk
git remote -v
git pull
echo "***** `date`" > make.log
make -j$((`nproc` + 1)) yaud-xbmc-nightly |& tee -a make.log
