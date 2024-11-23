---
title: GPG
---
# gpg

## Install GPG


### Update gnupg version on Debian / Raspberry Pi OS
```bash
export GNUPG_VERSION=2.4.6

wget "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-${GNUPG_VERSION}.tar.bz2"
tar -xjf gnupg-${GNUPG_VERSION}.tar.bz2
cd gnupg-${GNUPG_VERSION}
sudo apt install -y build-essential libassuan-dev libgpg-error-dev libgcrypt20-dev \
    libksba-dev libnpth-dev zlib1g-dev libbz2-dev libreadline-dev
./configure --disable-doc
make
sudo make install
gpg --version
```

### Update gpg-agent service
```bash
sudo nano /usr/lib/systemd/user/gpg-agent.service
```

```bash
[Unit]
Description=GnuPG cryptographic agent and passphrase cache
Documentation=man:gpg-agent(1)
Requires=gpg-agent.socket
After=gpg-agent.socket

[Service]
ExecStart=/usr/local/bin/gpg-agent --supervised
ExecReload=/usr/local/bin/gpgconf --reload gpg-agent
KillMode=process
Restart=always

[Install]
WantedBy=default.target
```

### Reload the system config

```bash
systemctl --user daemon-reload
```

### Restart the gpg-agent service

```bash
gpgconf --kill all
systemctl --user start gpg-agent.service
systemctl --user enable gpg-agent.service
```

### You may need to create the socket service

If this file is missing you will need to create it
```bash
sudo nano /usr/lib/systemd/system/gpg-agent.socket
```

```bash
[Unit]
Description=GnuPG cryptographic agent and passphrase cache (socket activation)
Documentation=man:gpg-agent(1)

[Socket]
ListenStream=%t/gnupg/S.gpg-agent
SocketMode=0600
DirectoryMode=0700
RuntimeDirectory=gnupg
RemoveOnStop=true

[Install]
WantedBy=sockets.target
```

Start the socket
```bash
sudo systemctl start gpg-agent.socket
## Using the GPG command line to encrypt and decrypt files

### Generate a new key
```bash
gpg --full-generate-key
```

Select option (9) for ECC (sign and encrypt)
```bash
Please select what kind of key you want:
   (1) RSA and RSA
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   (9) ECC (sign and encrypt) *default*
  (10) ECC (sign only)
  (14) Existing key from card
```

Select Curve 25519
```bash
(1) Curve 25519 *default*
```

### Export Public Key
```bash
gpg --armor --export "dev@mm-mac-studio.local" > /tmp/mm-studio-public-key.asc
```

### Verify the key
```bash
gpg --list-keys --fingerprint
```

# Secure the private key
```bash
chmod 700 ~/.gnupg
chmod 600 ~/.gnupg/private-keys-v1.d/*
```

### List all the public keys in the keyring
```bash
gpg --list-keys --with-colons | awk -F: '/^pub/{print $5}'
```

### Secure copy of the public key
```bash
scp /tmp/${KEY_NAME}.asc ${TARGET_USER}@${TARGET_HOST}:/tmp/${KEY_NAME}.asc
```

### Import the public key
```bash
gpg --import /tmp/${KEY_NAME}.asc
```

## Setup pinetry on debian linux / raspberry pi os

If you're getting the "No pinentry" error when using GPG, here's how to fix it:

1. First, install pinentry-curses (if not already installed):
```bash
sudo apt update
sudo apt install pinentry-curses
```

2. Create or edit the GPG agent configuration file:
```bash
mkdir -p ~/.gnupg
nano ~/.gnupg/gpg-agent.conf
```

3. Add the following line to specify the pinentry program:
```
pinentry-program /usr/bin/pinentry-curses
```

4. Save and exit (in nano: Ctrl+X, then Y, then Enter)

5. Restart the GPG agent:
```bash
gpg-connect-agent reloadagent /bye
```

"michael@mm-mba.local"
"dev@mm-mac-studio.local"
"michael@mm-mac-studio.local"
"dev@mm-mac-mini.local"
"dev@rpi1.local"
"dev@rpi2.local"
"dev@rpi3.local"

gpg --armor --export "michael@mm-mba.local" > /tmp/mm-mba-public-key.asc
gpg --armor --export "dev@mm-mac-mini.local" > /tmp/mm-mac-mini-public-key.asc
gpg --armor --export "dev@mm-mac-studio.local" > /tmp/mm-mac-studio-public-key.asc
gpg --armor --export "dev@rpi1.local" > /tmp/rpi1-public-key.asc
gpg --armor --export "dev@rpi2.local" > /tmp/rpi2-public-key.asc
gpg --armor --export "dev@rpi3.local" > /tmp/rpi3-public-key.asc

scp /tmp/mm-mba-public-key.asc dev@mm-mac-studio.local:/tmp/mm-mba-public-key.asc
scp /tmp/mm-mac-mini-public-key.asc dev@mm-mac-studio.local:/tmp/mm-mac-mini-public-key.asc
scp /tmp/mm-mac-studio-public-key.asc dev@mm-mac-studio.local:/tmp/mm-mac-studio-public-key.asc
scp /tmp/rpi1-public-key.asc dev@mm-mac-studio.local:/tmp/rpi1-public-key.asc
scp /tmp/rpi2-public-key.asc dev@mm-mac-studio.local:/tmp/rpi2-public-key.asc
scp /tmp/rpi3-public-key.asc dev@mm-mac-studio.local:/tmp/rpi3-public-key.asc



scp dev@mm-mac-studio.local:/tmp/mm-mac-studio-public-key.asc /tmp/mac_studio_pubkey.asc

scp /tmp/mm-mba-public-key.asc dev@mm-mac-studio.local:/tmp/mm-mba-public-key.asc
scp /tmp/mm-mba-public-key.asc dev@mm-mac-mini.local:/tmp/mm-mba-public-key.asc
scp /tmp/mm-mac-studio-public-key.asc dev@mm-mac-studio.local:/tmp/mm-mac-studio-public-key.asc

scp /tmp/mm-mba-public-key.asc



gpg --import /tmp/mm-mba-public-key.asc
gpg --import /tmp/mm-mac-mini-public-key.asc
gpg --import /tmp/mm-mac-studio-public-key.asc
gpg --import /tmp/rpi1-public-key.asc
gpg --import /tmp/rpi2-public-key.asc
gpg --import /tmp/rpi3-public-key.asc

ssh dev@mm-mac-mini.local 'gpg --import /tmp/mm-mba-public-key.asc'

gpg --list-keys --with-colons | awk -F: '/^pub/{print $5}'


5A55974373897ADA # dev@rpi2.local
ACE075ED75EC514B # dev@mm-mac-mini.local
0C306BA6E684C66B # dev@mm-mba.local
A9E360402EF80058 # dev@mm-mac-studio.local


# For rpi1
ssh dev@rpi1.local "gpg --armor --export dev@rpi1.local" > /tmp/rpi1_pubkey.asc

# For rpi2
ssh dev@rpi2.local "gpg --armor --export dev@rpi2.local" > /tmp/rpi2_pubkey.asc

# For rpi3
ssh dev@rpi3.local "gpg --armor --export dev@rpi3.local" > /tmp/rpi3_pubkey.asc

# For mac studio
ssh dev@mm-mac-studio.local "source ~/.zshrc && gpg --armor --export dev@mm-mac-studio.local" > /tmp/mac_studio_pubkey.asc

# For mac mini
ssh dev@mm-mac-mini.local "source ~/.zshrc && gpg --armor --export dev@mm-mac-mini.local" > /tmp/mac_mini_pubkey.asc

Here's how to transfer and import all public keys to each remote machine. For each machine, we'll copy all keys except its own:

```bash
# For rpi1.local (copy all except rpi1's key)
scp /tmp/{mac_mini,mac_studio,mba,rpi2,rpi3}_pubkey.asc dev@rpi1.local:/tmp/
ssh dev@rpi1.local "cat /tmp/*_pubkey.asc | gpg --import"
ssh dev@rpi1.local "rm /tmp/*_pubkey.asc"

# For rpi2.local (copy all except rpi2's key)
scp /tmp/{mac_mini,mac_studio,mba,rpi1,rpi3}_pubkey.asc dev@rpi2.local:/tmp/
ssh dev@rpi2.local "cat /tmp/*_pubkey.asc | gpg --import"
ssh dev@rpi2.local "rm /tmp/*_pubkey.asc"

# For rpi3.local (copy all except rpi3's key)
scp /tmp/{mac_mini,mac_studio,mba,rpi1,rpi2}_pubkey.asc dev@rpi3.local:/tmp/
ssh dev@rpi3.local "cat /tmp/*_pubkey.asc | gpg --import"
ssh dev@rpi3.local "rm /tmp/*_pubkey.asc"

# For mm-mac-studio.local (copy all except mac_studio's key)
scp /tmp/{mac_mini,mba,rpi1,rpi2,rpi3}_pubkey.asc dev@mm-mac-studio.local:/tmp/
ssh dev@mm-mac-studio.local "cat /tmp/*_pubkey.asc | /opt/homebrew/bin/gpg --import"
ssh dev@mm-mac-studio.local "rm /tmp/*_pubkey.asc"

# For mm-mac-mini.local (copy all except mac_mini's key)
scp /tmp/{mac_studio,mba,rpi1,rpi2,rpi3}_pubkey.asc dev@mm-mac-mini.local:/tmp/
ssh dev@mm-mac-mini.local "cat /tmp/*_pubkey.asc | /opt/homebrew/bin/gpg --import"
ssh dev@mm-mac-mini.local "rm /tmp/*_pubkey.asc"
```


scp ownertrust.txt dev@mm-mac-studio.local:/tmp/ownertrust.txt
scp ownertrust.txt dev@mm-mac-mini.local:/tmp/ownertrust.txt
scp ownertrust.txt dev@rpi1.local:/tmp/ownertrust.txt
scp ownertrust.txt dev@rpi2.local:/tmp/ownertrust.txt
scp ownertrust.txt dev@rpi3.local:/tmp/ownertrust.txt

ssh dev@rpi1.local 'gpg --import-ownertrust /tmp/ownertrust.txt'
ssh dev@rpi2.local 'gpg --import-ownertrust /tmp/ownertrust.txt'
ssh dev@rpi3.local 'gpg --import-ownertrust /tmp/ownertrust.txt'
