
# SSH

## Generate SSH key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Copy your public key to the target machine

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub username@target_mac_ip
```
