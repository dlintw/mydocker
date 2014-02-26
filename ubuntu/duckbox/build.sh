# enable ssh login
repo=https://github.com/dlintw/pdk7105-tdt
pgrep sshd>/dev/null || /usr/sbin/sshd -D &
cd /
[ -d /tdt/.git ] || git clone $repo tdt
cd /tdt/tdt/cvs/cdk
[ -d $HOME/Archive ] || ln -s /Archive $HOME/Archive
[ -r Makefile ] || ./make.sh 20 4 y 2 1 2 1 2
git remote -v
git pull origin master
make -j$((`nproc` + 1)) yaud-xbmc-nightly |& tee -a make.`date +%y%m%d%H%M%S`.log
[ $? != 0 ] && echo "***** make in multi-thread failed"
make yaud-xbmc-nightly |& tee -a make.`date +%y%m%d%H%M%S`.log
[ $? != 0 ] && echo "***** make in single-thread failed"
echo "OK rootfs: /tdt/tdt/tufsbox/release/"
T=$HOME/Archive/`date +%Y%m%d`.txz
tar -C /tdt/tdt/tufsbox/release/ -cJf $T .
ls -l $T
# vim:et sw=2 ts=2 ai:
