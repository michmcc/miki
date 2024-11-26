---
title: Mounting and Unmounting External Drives for Linux
---

## Listing disks

Listing disks using `lsblk`:

```bash
lsblk
```

Using fdisk:

```bash
fdisk -l
```

Listing disks using `lsblk` with more details:

```bash
lsblk -o NAME,FSTYPE,LABEL,UUID,MOUNTPOINT,MODEL,SIZE,ROTA,TYPE,VENDOR,SERIAL
```

List currently mounted disks:

```bash
df -h
```

## Mounting disk to local home directory

Mount an exFAT disk to local home directory:

```bash
sudo mount -t exfat /dev/sda1 ~/Volumes/L1
```

Mount an APFS disk to local home directory:

```bash
sudo mount -t apfs /dev/sda1 ~/Volumes/L1
```

Mount an exFat disk to local home directory:

```bash
sudo mount -t exfat -o uid=1000,gid=1000,umask=000 UUID=009A-0D61 /mnt/L1
```

Mount an ext4 disk to local home directory:

```bash
sudo mount -o uid=1000,gid=1000 /dev/sdb1 /mnt/SEA1
```
## Unmounting

Unmounting disk using disk identifier:

```bash
diskutil unmountDisk /dev/sda1
```

Unmounting disk using mount


## Initialize a new disk as ext4 and mount it to local home directory

Create a new disk image file:

Format partition as ext4:

```bash
sudo mkfs.ext4 /dev/sdb1
```

Create the mount point directory:

```bash
mkdir -p ~/Volumes/SEA1
```

Mount the disk image file to local home directory:
```bash
sudo mount /dev/sdb1  ~/Volumes/SEA1
sudo chown -R 1000:1000  ~/Volumes/SEA1
sudo chmod -R 775  ~/Volumes/SEA1
```
Format the disk image file:

```bash
sudo mkfs.ext4 /Volumes/L1/L1.img
```

Mount the disk image file to local home directory:

```bash
sudo mount -t ext4 /Volumes/L1/L1.img ~/Volumes/L1
```

Unmount the disk image file:

```bash
sudo umount /Volumes/L1
```

Delete the disk image file:

```bash
sudo rm /Volumes/L1/L1.img
```

### Remount all fstab entries

```bash
sudo mount -a
```

### Get the UUID of a disk

```bash
sudo blkid /dev/sda1
```
