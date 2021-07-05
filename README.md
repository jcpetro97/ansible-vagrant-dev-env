# Ansible Development and Testing templates

These are vagrant templates set up to do ansible development and testing.  Each OS ( listed below ) is set up with a control node, labled "server" and two clients labled "client1" and "client2"

Boxes are retrieved from Vagrant Cloud.  These templates _MAY_ work with other vagrant boxes, but it hasn't been tested.
## Requirements

* Virtualbox 
* Basic knowledge of an ansible project layout
* Knowledge of vagrant commands
* vagrant-hosts plugin installed

`vagrant plugin install vagrant-hosts`


## OS/Vagrant Box/IP Information

| OS         | vagrant box name                         | 
| ---------- | ---------------------------------------- |
| ubuntu2004 | jcpetro97/ubuntu2004                     |
| centos7    | jcpetro97/centos7                        |
| centos8    | jcpetro97/centos8                        |
| mixedOS    | jcpetro97/[centos7, centos8, ubuntu2004] | 

**NOTE:** If you want a development environment where the control node OS is the same as the clients, those can be found in the **SingleOS** directory

## How to Initialize

* Clone this repository to your local machine
* cd into the OS directory you want to use

_Spin up the ansible server_

* vagrant up <VM name>

ex. `vagrant up server`

**NOTE:** By default, when you spin up the server VM, it will install ansible from the 2.9.x tree.  If you want to use ansible from a different version tree, do the following:

env ANSIBLE_VERSION=_**VersionNumber**_ vagrant up server

`env ANSIBLE_VERSION=2.10.4 vagrant up server`

_Spin up clients_

`vagrant up client1`

**NOTE:** If you can put the name of the second client on the command line, just separate the VM names by a space.

## How to use

`/vagrant` is a shared folder, mapped from the host to the guest.  The source of `/vagrant` is the current working directory when the server was initialized.  

A basic ansible project structure is already there and it follows the ansible recommended alternate layout best practices.  

**NOTE:** The layout used, can be used with either the ansible-galaxy method for roles, or the traditional method.  If you are developing for a role to be used with AWX/Tower, then I would recommend the ansible-galaxy method for roles.  See roles/requirements.yml for some detail.

Basically, develop the playbook/role on the host, inside the directory of the OS desired.  To test, spin up the server, and one or both clients.  Log into the "server", cd to /vagrant and run the ansible playbook.

## How to add more nodes

* edit the Vagrantfile
* change the following line  `(1..2).each do |i|`  and increment it to whatever you need
* edit the inventory/vagrant file and add the additional entries that you need.  

example:

```
(1..4).each do |i|

inventory/vagrant - add the following lines:

OsName-node3
OsName-node4

```

* You can change the subnet by editing the SUBNET variable in the Vagrantfile.
* If you want a different OS, change `jcpetro97/ubuntu2004` to another box name from vagrant cloud ( ie. jcpetro97/centos8 or geerlingguy/debian10, etc)  just edit the appropriate variable (OSNAME_IMAGE) in the vagrantfile.
* The control nodes and "clients"  wil all be added to the VM's /etc/hosts files thanks to the vagtant-hosts plugin.
* run `vagrant status` to see if the changes that were made are correct
* If there are no errors, run `vagrant up <NEW VM NAME>`

**NOTE:** I currently have the following vagrant boxes hosted at vagrant cloud: jcpetro97/centos7, jcpetro97/centos8, jcpetro97/ubuntu1804, jcpetro97/ubuntu2004.