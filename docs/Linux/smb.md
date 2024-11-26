---
title: SMB Sharing from Linux
---

## Install Samba

Install Samba:

```
sudo apt-get install samba samba-common-bin
```

## Create a Samba Share

Create a Samba share:

```
sudo smbpasswd -a dev
```

Create a Samba share with a password:

```
sudo smbpasswd -a dev
New SMB password:
Re-enter new SMB password:
passwd: password updated successfully
```

## Create a Samba Share

Create a Samba share:

```
sudo mkdir /home/dev/share
sudo chown dev:dev /home/dev/share
```

Edit the Samba configuration file:

```
sudo nano /etc/samba/smb.conf
```

Add the following lines:

```
[share]
path = /home/dev/share
read only = no
guest ok = yes
create mask = 0777
directory mask = 0777
browseable = yes
public = yes
writable = yes
printable = yes
force user = dev
force group = dev
```

Restart the Samba service:

```
sudo systemctl restart smbd
```

Test the Samba share:

```
smbclient -L //dev@192.168.1.10/share
smbclient -L //dev@192.168.1.10/share
ls //dev@192.168.1.10/share
cd //dev@192.168.1.10/share
pwd
get testfile
put testfile
rm testfile
exit
```

### Test file speed

```bash
fio --name=test --filename=~/Volumes/T71/testfile --size=1G --time_based --runtime=30 --ioengine=posixaio --rw=randwrite --bs=4k --iodepth=32 --direct=1
```

### Test file speed

```bash
fio --name=test --filename=~/Volumes/T71/testfile --size=1G --time_based --runtime=30 --ioengine=posixaio --rw=randwrite --bs=4k --iodepth=32 --direct=1
```
