---
title: Mounting and Unmounting Exteral Drives
---

### Listing disks

Listing disks using diskutil:

```bash
diskutil list
```

Listing disks using diskutil with more details:

```bash
diskutil list -plist
```

List currently mounted disks:

```bash
df -h
```

### Mounting disk to local home directory

```bash
sudo mount -t exfat /dev/disk4s2 ~/Volumes/L1
```

Mount an APFS disk to local home directory:

```bash
sudo mount -t apfs /dev/disk4s2 ~/Volumes/L1
```

Using diskutil to mount an APFS disk to local home directory:

```bash
diskutil mount -mountPoint ~/Volumes/L1 /dev/disk7s1
```

```bash
diskutil mount -mountPoint ~/Volumes/T72 /dev/disk5s1

###	Unmounting


Unmounting disk using disk identifier:

```bash
diskutil unmountDisk /dev/disk4s2
```

Unmounting disk using mount point:

```bash
diskutil unmount /Volumes/L1
```

Force unmounting disk using mount point:

```bash
diskutil unmount force /Volumes/L1
```

###	Update /etc/fstab with Disk Identifier:
```bash
sudo nano /etc/fstab
```

Add the following line:
```bash
/dev/disk6s2 /Users/dev/Volumes/L1 exfat rw
```

### Mount samba share from raspberry pi


Create the local directory:

```bash
mkdir -p ~/Volumes/RPI2
```

```bash
mount_smbfs //dev@rpi2.local/RPI2 /Volumes/RPI2
```

OR

```bash
mount_smbfs //shared@rpi2.local/L1 ~/Volumes/L1
```

### restart and check smbd status on raspi

```bash
sudo systemctl restart smbd
sudo systemctl status smbd
```

### mount from another mac through terminal

```bash
mount_smbfs //pi@mm-mac-studio.local/pi/Volumes/L1 ~/Volumes/L1
```

```bash
mount_smbfs //shared@rpi2.local/L1 ~/Volumes/L1
```

### Test file speed

```bash
fio --name=test --filename=~/Volumes/T71/testfile --size=1G --time_based --runtime=30 --ioengine=posixaio --rw=randwrite --bs=4k --iodepth=32 --direct=1
```
