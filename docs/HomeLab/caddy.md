---
title: Caddy
---

# Increase the buffer size

Increase the buffer size by adding the following to /etc/sysctl.conf:
```bash
sudo nano /etc/sysctl.conf
```

```bash
net.core.rmem_max=7500000
net.core.rmem_default=7500000
```

Apply the changes:
```bash
sudo sysctl -p
```

If Caddy is running as a non-root user, such as when it runs on Debian as caddy,
you need to modify /etc/default/tailscaled to grant the user access to fetch the certificate.
In /etc/default/tailscaled, set the TS_PERMIT_CERT_UID environment variable to the name or ID of the non-root user:

```bash
TS_PERMIT_CERT_UID=caddy
```
