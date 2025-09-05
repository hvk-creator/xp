from debian:latest
user root 
workdir /tmp 
run apt-get update 
run apt-get install -y qemu-system-x86 wget curl -y   
run wget https://dl.malwarewatch.org/windows/Windows-XP.iso 
run qemu-img create -f qcow2 xp.qcow2 50G 
expose 5901 
cmd ["wget https://github.com/hvk-creator/xp/blob/main/move.sh", "&&", "bash", "move.sh", "qemu-system-x86_64", "-m", "256m", "-hda", "/root/xp.qcow2", "-cdrom", "/root/xp.iso", "-boot", "once=d", "-net", "nic", "-net", "user", "-usbdevice", "tablet", "-daemonize", "-vnc", ":1"]
