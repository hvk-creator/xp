from debian:latest
user root
workdir /root
run DEBIAN_FRONTEND=noninteractive \
    apt update \
    apt-get install -y neofetch qemu-system-x86 wget curl \
    wget https://dl.malwarewatch.org/windows/Windows-XP.iso \
    qemu-img create -f qcow2 xp.qcow2 50G

expose 5901
cmd ["qemu-system-x86_64", "-m", "256m", "-hda", "xp.qcow2", "-cdrom", "Windows-XP.iso", "-boot", "once=d", "-net", "nic", "-net", "user", "-usbdevice", "tablet", "-daemonize", "-vnc", ":1"]
