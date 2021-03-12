#!/bin/bash
ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.9.18}

# Install Python.
/bin/echo "------> installing python3 <------"
/usr/bin/apt update
/usr/bin/apt -y install python3 python3-pip sshpass
/bin/echo "------> upgrade pip <------"
/usr/bin/python3 -m pip install --upgrade pip
/bin/echo "------> upgrade setuptools <------"
/usr/bin/python3 -m pip install --upgrade setuptools
# # Install Ansible.
if [[ $ANSIBLE_VERSION =~ "2.9" ]]
then
    /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
    /usr/bin/python3 -m pip install ansible==$ANSIBLE_VERSION

else    
    /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
    /usr/bin/python3 -m pip install ansible-base==$ANSIBLE_VERSION

fi
#
/bin/echo "------> Verify Ansible Version <------"
/usr/local/bin/ansible --version