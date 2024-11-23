---
title: Chezmoi
---

Chezmoi is a tool for managing configuration files. It can be used to apply changes to configuration files, and to revert changes.

## Install

```bash
brew install chezmoi
```

## Usage


### Edit a file that is not in the home directory

```bash
chezmoi edit /etc/ssh/sshd_config --destination /etc/ssh
```
