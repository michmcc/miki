---
title: Tailscale
description: Tailscale is a zero config VPN that just works.
---

# Tailscale

Tailscale is a zero config VPN that just works.

## Requirements

- Tailscale account

## Setup on macOS

### Install

1. Setup using Homebrew

```bash
brew install tailscale
```

Or you can add to chezmoi packages.

2. Start the service

```bash
tailscale up
```

```bash
sudo nano /Library/LaunchDaemons/com.tailscale.tailscaled.plist
```


```bash
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.tailscale.tailscaled</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/opt/tailscale/bin/tailscaled</string>
        <string>--state=/var/lib/tailscale/tailscaled.state</string>
        <string>--socket=/var/run/tailscale/tailscaled.sock</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardErrorPath</key>
    <string>/var/log/tailscaled.err.log</string>
    <key>StandardOutPath</key>
    <string>/var/log/tailscaled.out.log</string>
</dict>
</plist>
```
