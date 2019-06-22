---
layout: post
title: "How to create python virtual environment"
description: "How to install python env and how to use it"
date: 2019-06-23
tags: Python, Virtual env
keywords: python virtual env, virtual env, virtual environment using python, how to install python virtual env, how to install python virtual environment
comments: true
---

# Steps to install Python Virtual Environment 

1. Install Python

2. Install Python Pip

3. Install Virtual enviroment

## Command to install Python

```bash
sudo apt install python
```

## Command to install Python-Pip

```bash
sudo apt-get install python-pip
```

## Command to install Virtual Env

```bash
pip install virtual env

sudo apt install virtualenv
```

##### Now you have successfully installed the Python Virtual Environment. The next is how to create a virtual env.

##### Make a directory where you want to setup this virtual env. And follow the commands.

##### This is a example. I have created a directory named environments and inside that directory I have created a virtual-env named project1.

```bash
mkdir environments;

cd environments;

virtualenv project1;
```

##### This is the command to activate the virtual-env

```bash
source project1/bin/activate
```

##### Now you are successfully activated the virtual-env. You can see your project name in you terminal.

##### To deactivate and come out of the virtual-env using this command

```bash
deactivate
```

##### If you need to access this virtual-env you can go back to the last directory and activate it using the last command we used to activate.