---
title: hostname
---

# hostname

### Set the Hostname on MacOS

```bash
sudo scutil --set ComputerName "HOSTNAME"
sudo scutil --set HostName "HOSTNAME"
sudo scutil --set LocalHostName "HOSTNAME"
```

```bash
scutil --get ComputerName
scutil --get HostName
scutil --get LocalHostName
```

### Set the Hostname on Ubuntu

```bash
sudo hostnamectl set-hostname HOSTNAME
```

### Check to make sure the hostname is set correctly
