#!/bin/bash
ANSIBLE_VERSION=2.9.18
# Install Python.
/usr/bin/echo "------> installing python3 <------"
/usr/bin/yum -y install python3 python3-pip sshpass
/usr/bin/echo "------> upgrade pip <------"
/usr/bin/python3 -m pip install --upgrade pip
/usr/bin/echo "------> upgrade setuptools <------"
/usr/bin/python3 -m pip install --upgrade setuptools
# Install Ansible.
# # Install Ansible.
if [[ $ANSIBLE_VERSION =~ "2.9" ]]
then
    /usr/bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
    /usr/bin/python3 -m pip install ansible==$ANSIBLE_VERSION

else    
    /usr/bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
    /usr/bin/python3 -m pip install ansible-base==$ANSIBLE_VERSION

fi
#

/usr/bin/echo "------> Install Ansible 2.9 <------"
/usr/bin/python3 -m pip install ansible==$ANSIBLE_VERSION
#
/usr/bin/echo "------> Verify Ansible Version <------"
/usr/local/bin/ansible --version