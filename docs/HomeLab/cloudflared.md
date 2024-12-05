---
title: Cloudflared
---

Cloudflared is a command-line tool that allows you to tunnel traffic to a local server over HTTPS. It can be used to create secure tunnels to local services, such as databases, web servers, and APIs.


### Setting up Cloudflared for DNS over HTTPS

Source: [Cloudflared DNS over HTTPS](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/)

1. Install cloudflared
```bash
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64
sudo mv -f ./cloudflared-linux-arm64 /usr/local/bin/cloudflared
sudo chmod +x /usr/local/bin/cloudflared
cloudflared -v
```

2. Create a cloudflared account to run the daemon
```bash
sudo useradd -s /usr/sbin/nologin -r -M cloudflared
```

3. Create a tunnel
```bash
sudo nano /etc/default/cloudflared
```

Add the following to the file:
```bash
# Commandline args for cloudflared, using Cloudflare DNS
CLOUDFLARED_OPTS=--port 5053 --upstream https://cloudflare-dns.com/dns-query
```

4. Update the permissions for the configuration file and cloudflared binary to allow access for the cloudflared user:

```bash
sudo chown cloudflared:cloudflared /etc/default/cloudflared
sudo chown cloudflared:cloudflared /usr/local/bin/cloudflared
```

5. Copy the following into /etc/systemd/system/cloudflared.service

```bash
sudo nano /etc/systemd/system/cloudflared.service
```
```bash
[Unit]
Description=cloudflared DNS over HTTPS proxy
After=syslog.target network-online.target

[Service]
Type=simple
User=cloudflared
EnvironmentFile=/etc/default/cloudflared
ExecStart=/usr/local/bin/cloudflared proxy-dns $CLOUDFLARED_OPTS
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
```

6. Enable the systemd service to run on startup, then start the service and check its status:

```bash
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
sudo systemctl status cloudflared
```

7. Test dig

```bash
dig @127.0.0.1 -p 5053 google.com
```
