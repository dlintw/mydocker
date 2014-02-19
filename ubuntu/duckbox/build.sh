/usr/sbin/sshd -D
cd /pdk7105-tdt/tdt/cvs/cdk
git remote -v
git pull
make -j$((`nproc` + 1)) yaud-xbmc-nightly
EOF
