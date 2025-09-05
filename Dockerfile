from debian:latest
user root #Logs in as root user
workdir /tmp #Sets /tmp as the working directory
run apt-get update #Updates the APT repository
run apt-get install -y qemu-system-x86 wget curl -y   #Installed required packages 
run wget https://dl.malwarewatch.org/windows/Windows-XP.iso #Download the Windows ISO
run qemu-img create -f qcow2 xp.qcow2 50G #Creates the Windows image
expose 5901 #Exposes port 5901
cmd ["wget","https://github.com/hvk-creator/xp/blob/main/move.sh", "&&", "bash", "move.sh", "qemu-system-x86_64", "-m", "256m", "-hda", "/root/xp.qcow2", "-cdrom", "/root/xp.iso", "-boot", "once=d", "-net", "nic", "-net", "user", "-usbdevice", "tablet", "-daemonize", "-vnc", ":1"] #Moves both images to /root, then launches a QEMU instance using both images
