# enable ssh login
pgrep sshd>/dev/null || /usr/sbin/sshd -D &
[ -d /pdk7105-tdt/.git ] || git clone https://github.com/dlintw/pdk7105-tdt
cd /pdk7105-tdt/tdt/cvs/cdk
[ -d $HOME/Archive ] || ln -s /Archive $HOME/Archive
[ -r Makefile ] || ./make.sh 20 4 y 2 1 2 1 2
git remote -v
git pull origin master
make -j$((`nproc` + 1)) yaud-xbmc-nightly |& tee -a make.`date +%y%m%d%H%M%S`.log
[ $? != 0 ] && echo "***** make in multi-thread failed"
make yaud-xbmc-nightly |& tee -a make.`date +%y%m%d%H%M%S`.log
[ $? != 0 ] && echo "***** make in single-thread failed"
echo "OK rootfs: /pdk7105-tdt/tdt/tufsbox/release/"
T=$HOME/Archive/`date +%Y%m%d`.txz
tar -C /pdk7105-tdt/tdt/tufsbox/release/ -cJf $T .
ls -l $T
# vim:et sw=2 ts=2 ai:
