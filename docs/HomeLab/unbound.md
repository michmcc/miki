---
title: Unbound
---

Unbound is a validating, recursive, and caching DNS resolver. It is designed to be fast and lean and suitable for use as a local caching DNS server. It supports modern DNS protocols such as DNSSEC, DNS-over-TLS, and DNS-over-HTTPS.

### Installing Unbound with Pi-hole

Source: [Unbound DNS](https://docs.pi-hole.net/guides/dns/unbound/)

#### Install

```bash
sudo apt install unbound -y
```

(Optional) Install dns-utils for dig

```bash
sudo apt install dnsutils -y
```

### Editing config


```bash
sudo nano /etc/unbound/unbound.conf.d/pi-hole.conf
```

Check the config file for errors and correct them.

```bash
sudo unbound-checkconf
```

### Restarting the Unbound service

```bash
sudo systemctl restart unbound
sudo systemctl enable unbound
```

### Optimizing Unbound



```bash
# use all CPUs
num-threads: <number of cores>

# power of 2 close to num-threads
msg-cache-slabs: <same>
rrset-cache-slabs: <same>
infra-cache-slabs: <same>
key-cache-slabs: <same>

# more cache memory, rrset=msg*2
rrset-cache-size: 100m
msg-cache-size: 50m

# more outgoing connections
# depends on number of cores: 1024/cores - 50
outgoing-range: 950

# Larger socket buffer.  OS may need config.
so-rcvbuf: 4m
so-sndbuf: 4m

# Faster UDP with multithreading (only on Linux).
so-reuseport: yes
```

### Monitoring Unbound

```bash
sudo /usr/sbin/unbound-control stats_noreset
```
