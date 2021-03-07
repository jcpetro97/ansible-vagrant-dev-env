#!/bin/bash

# Install Python.
/bin/echo "------> installing python3 <------"
/usr/bin/apt update
/usr/bin/apt -y install python3 python3-pip sshpass
/bin/echo "------> upgrade pip <------"
/usr/bin/python3 -m pip install --upgrade pip
/bin/echo "------> upgrade setuptools <------"
/usr/bin/python3 -m pip install --upgrade setuptools
# Install Ansible.
/bin/echo "------> Install Ansible 2.9 <------"
/usr/bin/python3 -m pip install ansible==2.9.18
#
/bin/echo "------> Verify Ansible Version <------"
/usr/local/bin/ansible --version