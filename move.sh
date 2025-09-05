if ! [ -e /root/xp.iso ] ; then
  mv /disk/Windows-XP.iso /root/xp.iso
fi

if ! [ -e /root/xp.qcow2 ] ; then
  mv /disk/xp.qcow2 /root/xp.qcow2
fi
