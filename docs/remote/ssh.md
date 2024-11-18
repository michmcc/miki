---
title: ssh
---

# Setting up SSH

SSH (Secure Shell) is a protocol that allows you to securely connect to a remote server. It provides a secure way to access and manage remote systems over an unsecured network.

### Generating an SSH Key Pair
This will generate an SSH key pair on your local machine.

```bash
ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f "$HOME/.ssh/id_ed25519"
```

### Copying the Public Key to the Remote Server
After generating the SSH key pair, you need to copy the public key to the remote server. You can do this by running the following command:

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub <remote-server-address>
```

This will copy the public key to the remote server.

Once the SSH key pair is configured, you can connect to the remote server using the following command:

```bash
ssh <remote-server-address>
```

This will open an SSH session with the remote server.

### Configuring SSH to Use a Specific Key Pair
You can also configure SSH to use a specific key pair by creating a `config` file in the `~/.ssh` directory. For example, you can create a `config` file in the `~/.ssh` directory with the following content:

```
Host <remote-server-address>
  IdentityFile ~/.ssh/id_ed25519
```

This will configure SSH to use the `id_ed25519` key pair for the specified remote server.

### Adding SSH Key to the Agent
You can add the SSH key to the SSH agent by running the following command:
```bash
eval "$(ssh-agent -s)"
```

This will start the SSH agent and add the SSH key to the agent.
```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

### Testing SSH Connection for GitHub
To test the SSH connection for GitHub, you can run the following command:

```bash
ssh -T git@github.com
```

This will open an SSH session with GitHub.
