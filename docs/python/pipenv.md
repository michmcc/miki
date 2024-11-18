---
title: pipenv
---

# Setting up a Python Virtual Environment with Pipenv

Pipenv is a tool that allows you to create and manage virtual environments for your Python projects. It provides a way to isolate your project's dependencies from your system's Python installation, ensuring that your project will work consistently across different environments.

### Create a Virtual Environment
After installing Pipenv, you need to create a virtual environment for your project. You can do this by running the following command:

```bash
pipenv --python 3.12.7
```

This will create a new virtual environment using Python version 3.12.7.

### Activate the Virtual Environment
Once the virtual environment is created, you can activate it by running the following command:

```bash
pipenv shell
```

This will activate the virtual environment and set it as the current working directory.

### Install Packages
After activating the virtual environment, you can install packages using the `pip` command. For example, to install the `requests` package, you can run the following command:

```bash
pip install requests
```

This will install the `requests` package in the virtual environment.

### Create a Requirements File
You can also create a `requirements.txt` file in your project directory to specify the packages that your project depends on.

```bash
touch requirements.txt
pip freeze > requirements.txt
```

This file can be used to install the required packages using the `pip install -r requirements.txt` command.

```bash
pip install -r requirements.txt
```

### Deactivate the Virtual Environment

To deactivate the virtual environment, you can run the following command:

```bash
deactivate
```

This will deactivate the virtual environment and return you to your system's default Python environment.

You can also specify the Python version for a virtual environment by creating a `.python-version` file in the project directory. For example, you can create a `.python-version` file in your project directory with the following content:

```
3.12.7
```

This will set Python version 3.12.7 as the default version for the virtual environment.

To activate the Python version for a virtual environment, you can run the following command:

```bash
pipenv --python 3.12.7
```

This will set Python version 3.12.7 as the default version for the virtual environment.

After setting the Python version, you can verify it by running the following command:

```bash
python --version
```

This will display the current Python version.
