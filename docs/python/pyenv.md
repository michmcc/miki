---
title: pyenv
---

# Setting up a Python Version with pyenv

pyenv is a tool that allows you to easily switch between different versions of Python. It makes it easy to manage multiple Python versions on your system and ensures that you're always using the correct version for your project.

To get started with pyenv, you need to install it first. You can do this by running the following command:

```bash
brew install pyenv
```

After installing pyenv, you need to initialize it by running the following command:

```bash
pyenv init
```

This will initialize pyenv and set up the necessary environment variables.

Next, you need to install Python versions. You can do this by running the following command:

```bash
pyenv install 3.12.7
```

This will install Python version 3.12.7 on your system.

After installing Python versions, you can switch between them using the `pyenv shell` command. For example, to switch to Python version 3.12.7, you can run the following command:

```bash
pyenv shell 3.12.7
```

This will set Python version 3.12.7 as the current version for your shell session.

You can also set the Python version for a specific directory by creating a `.python-version` file in that directory. For example, you can create a `.python-version` file in your home directory with the following content:

```
3.12.7
```

This will set Python version 3.12.7 as the default version for all directories within your home directory.

To activate the Python version for a specific directory, you can run the following command:

```bash
pyenv local 3.12.7
```

This will set Python version 3.12.7 as the default version for the current directory and its subdirectories.

You can also set the Python version for all directories by running the following command:

```bash
pyenv global 3.12.7
```

This will set Python version 3.12.7 as the default version for all directories on your system.

After setting the Python version, you can verify it by running the following command:

```bash
python --version
```

This will display the current Python version.

If you want to install a specific version of Python, you can use the `pyenv install` command. For example, to install Python version 3.12.7, you can run the following command:

```bash
pyenv install 3.12.7
```
