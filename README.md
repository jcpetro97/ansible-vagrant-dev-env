# Ansible Development and Testing templates

These are vagrant templates set up to do ansible development and testing.  Each OS ( listed below ) is set up with a control node, labled "OSName-controlnode" and two clients labled "OSName-node1" and "OSName-node2"

Boxes are retrieved from Vagrant Cloud.  These templates _MAY_ work with other vagrant boxes, but it hasn't been tested.
## Requirements

* Virtualbox 
* Basic knowledge of an ansible project layout
* Knowledge of vagrant commands
* vagrant-hosts plugin installed

`vagrant plugin install vagrant-hosts`

**NOTE:** Linux/MacOS hosts can only have a total of 128 HostOnly networks defined.  In Virtualbox 6.1.30, they started to enforce that limitation. By default the allowed HostOnly ranges are 192.168.56.0/21 ( 192.168.56 -> 192.168.63).  The valid networks can be changed. To change the subnets, do the following:

* create/edit the file `/etc/vbox/networks.conf`
* add the following options inside the file ( including the * )

```
* 192.168.0.0/16
```

This will add all of the entire 192.168.0 range.  You can also add multiple subnets by changing the entry to this:

```
* 192.168.0.56/21 192.168.10.0/24
```

**WARNING:** if you add the `/etc/vbox/networks.conf` file but don't put any content inside it, Virtualbox will not allow ANY HostOnly networks to be created.


## OS/Vagrant Box

| OS         | vagrant box name                         | 
| ---------- | ---------------------------------------- |
| ubuntu2004 | jcpetro97/ubuntu2004                     |
| centos7    | jcpetro97/centos7                        |
| centos8    | jcpetro97/centos8                        |

**NOTE:** There are ansible control nodes and clients defined for each OS

## How to Initialize

* Clone this repository to your local machine
* Either start development here, or move the VagrantFile to an existing **Ansible Project Directory** and work on it from there.  

**NOTE:** To do the development, you need to set up an ansible project directory, based on the Ansible best practices.  When you clone this repository, it will be set up just like the "alternate" method documented on the ansible website. 

_Spin up the ansible server_

* vagrant up <VM name>

ex. `vagrant up ubuntu-controlnode`

**NOTE:** By default, when you spin up the controlnode VM, it will install the latest released ansile version in the pip repository.  If you want to use ansible from a different version tree, do the following:

env ANSIBLE_VERSION=_**VersionNumber**_ vagrant up <OS name>-controlnode

`env ANSIBLE_VERSION=4.0.3 vagrant up server`

**NOTE:** If you are using powershell, execute the following instead of the command referenced above.

```
PS C:\Users\USERNAME\dvl>$env:ANSIBLE_VERSION="4.0.3"
PS C:\Users\USERNAME\dvl>vagrant up <OS name>-controlnode

```

_Spin up clients (nodes)_

`vagrant up ubuntu-node1`

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

OSName-node3
OSName-node4

```

* You can change the subnet by editing the SUBNET variable in the Vagrantfile.
* If you want a different OS, change `jcpetro97/ubuntu2004` to another box name from vagrant cloud ( ie. jcpetro97/centos8 or geerlingguy/debian10, etc)  just edit the appropriate variable (OSNAME_IMAGE) in the vagrantfile.
* The control nodes and "clients"  wil all be added to the VM's /etc/hosts files thanks to the vagtant-hosts plugin.
* run `vagrant status` to see if the changes that were made are correct
* If there are no errors, run `vagrant up <NEW VM NAME>`

**NOTE:** I currently have the following vagrant boxes hosted at vagrant cloud: jcpetro97/centos7, jcpetro97/centos8, jcpetro97/ubuntu1804, jcpetro97/ubuntu2004.
