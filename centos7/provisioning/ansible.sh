#!/bin/bash

# Install Python.
/usr/bin/echo "------> installing python3 <------"
/usr/bin/yum -y install python3 python3-pip
/usr/bin/echo "------> upgrade pip <------"
/usr/bin/python3 -m pip install --upgrade pip
/usr/bin/echo "------> upgrade setuptools <------"
/usr/bin/python3 -m pip install --upgrade setuptools
# Install Ansible.
/usr/bin/echo "------> Install Ansible 2.9 <------"
/usr/bin/python3 -m pip install ansible==2.9.17
