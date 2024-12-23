---
title: Keepalived
---

# Keepalived

## Overview

Keepalived is a high-availability virtual server clustering tool designed to provide high availability and load balancing for TCP and UDP based applications. It is a layer 4 load balancer that runs on Linux and BSD systems. It supports a wide variety of network protocols, including TCP, HTTP, SMTP, POP3, IMAP, FTP, and MySQL.

## Installation

### Installing on CentOS

```bash
sudo yum install keepalived
```

### Installing on Ubuntu

```bash
sudo apt-get install keepalived
```

### Installing on Debian

```bash
sudo apt install keepalived
```

### Installing on Fedora

```bash
sudo dnf install keepalived
```

## Commands

### Restart the service

```bash
sudo systemctl restart keepalived
```

### Check the status of the service

```bash
sudo systemctl status keepalived
```

### Check the service logs

```bash
sudo journalctl -u keepalived
```

## Configuration

The configuration file for Keepalived is located at `/etc/keepalived/keepalived.conf`. The configuration file is divided into several sections, each of which contains a set of configuration options. The sections are as follows:

- `global` section: This section contains global configuration options that apply to all virtual servers.
- `vrrp_instance` section: This section contains configuration options for a specific virtual server.
- `vrrp_script` section: This section contains configuration options for a specific virtual server script.

The configuration file is divided into several sections, each of which contains a set of configuration options. The sections are as follows:

- `global` section: This section contains global configuration options that apply to all virtual servers.
- `vrrp_instance` section: This section contains configuration options for a specific virtual server.
- `vrrp_script` section: This section contains configuration options for a specific virtual server script.


## Editing the Configuration File

To edit the configuration file, use the following command:

```bash
sudo nano /etc/keepalived/keepalived.conf
```

This will open the configuration file in the Nano text editor. Make the necessary changes to the configuration file and save the file.

## Viewing the Configuration File

To view the configuration file, use the following command:

```bash
sudo cat /etc/keepalived/keepalived.conf
```

This will display the contents of the configuration file.

#### Global Configuration Options

| Option | Description |
| --- | --- |
| `global_defs` | This option specifies the default configuration options for all virtual servers. |
| `vrrp_version` | This option specifies the version of the VRRP protocol to use. |
| `vrrp_ipaddress` | This option specifies the IP address of the virtual server. |
| `vrrp_ipv6address` | This option specifies the IPv6 address of the virtual server. |
| `vrrp_ipvs_timeout` | This option specifies the timeout value for the virtual server. |
| `vrrp_ipvs_version` | This option specifies the version of the VRRP protocol to use. |
| `vrrp_ipvs_vip` | This option specifies the virtual IP address of the virtual server. |
| `vrrp_ipvs_vip6` | This option specifies the virtual IPv6 address of the virtual server. |
| `vrrp_ipvs_vrid` | This option specifies the virtual router ID of the virtual server. |
| `vrrp_ipvs_vrid6` | This option specifies the virtual router ID of the virtual server. |
| `vrrp_ipvs_priority` | This option specifies the priority of the virtual server. |
| `vrrp_ipvs_auth_type` | This option specifies the authentication type of the virtual server. |
| `vrrp_ipvs_auth_pass` | This option specifies the authentication password of the virtual server. |
| `vrrp_ipvs_auth_user` | This option specifies the authentication username of the virtual server. |
| `vrrp_ipvs_auth_noencrypt` | This option specifies whether to disable encryption for the virtual server. |
| `vrrp_ipvs_auth_noverify` | This option specifies whether to disable verification for the virtual server. |
| `vrrp_ipvs_auth_type` | This option specifies the authentication type of the virtual server. |
| `vrrp_ipvs_auth_pass` | This option specifies the authentication password of the virtual server. |
| `vrrp_ipvs_auth_user` | This option specifies the authentication username of the virtual server. |
| `vrrp_ipvs_auth_noencrypt` | This option specifies whether to disable encryption for the virtual server. |
| `vrrp_ipvs_auth_noverify` | This option specifies whether to disable verification for the virtual server. |

### Virtual Server Configuration Options

| Option | Description |
| --- | --- |
| `priority` | This option specifies the priority of the virtual server. |
| `advert_int` | This option specifies the advertisement interval for the virtual server. |
| `virtual_router_id` | This option specifies the virtual router ID of the virtual server. |
| `virtual_ipaddress` | This option specifies the virtual IP address of the virtual server. |
| `virtual_ipv6address` | This option specifies the virtual IPv6 address of the virtual server. |
| `virtual_ipvs_ip` | This option specifies the virtual IP address of the virtual server. |
| `virtual_ipvs_ipv6` | This option specifies the virtual IPv6 address of the virtual server. |
| `virtual_ipvs_port` | This option specifies the virtual port of the virtual server. |
| `virtual_ipvs_protocol` | This option specifies the virtual protocol of the virtual server. |
| `virtual_ipvs_auth_type` | This option specifies the authentication type of the virtual server. |
| `virtual_ipvs_auth_pass` | This option specifies the authentication password of the virtual server. |
| `virtual_ipvs_auth_user` | This option specifies the authentication username of the virtual server. |
| `virtual_ipvs_auth_noencrypt` | This option specifies whether to disable encryption for the virtual server. |
| `virtual_ipvs_auth_noverify` | This option specifies whether to disable verification for the virtual server. |
| `virtual_ipvs_auth_type` | This option specifies the authentication type of the virtual server. |
| `virtual_ipvs_auth_pass` | This option specifies the authentication password of the virtual server. |
| `virtual_ipvs_auth_user` | This option specifies the authentication username of the virtual server. |
| `virtual_ipvs_auth_noencrypt` | This option specifies whether to disable encryption for the virtual server. |
| `virtual_ipvs_auth_noverify` | This option specifies whether to disable verification for the virtual server. |
