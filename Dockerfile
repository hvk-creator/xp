from debian:latest
user root 
workdir /disk
run apt-get update 
run apt-get install -y qemu-system-x86 wget curl -y   
run wget https://dl.malwarewatch.org/windows/Windows-XP.iso 
run qemu-img create -f qcow2 xp.qcow2 50G
run wget https://raw.githubusercontent.com/hvk-creator/xp/refs/heads/main/move.sh
expose 5901 
cmd ["bash", "/disk/move.sh", "&&", "qemu-system-x86_64", "-m", "256m", "-hda", "/root/xp.qcow2", "-cdrom", "/root/xp.iso", "-boot", "once=d", "-net", "nic", "-net", "user", "-usbdevice", "tablet", "-daemonize", "-vnc", ":1"]
