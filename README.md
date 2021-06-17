# Ansible Development and Testing templates

These are vagrant templates set up to do ansible development and testing.  Each OS ( listed below ) is set up with a control node, labled "server" and two clients labled "client1" and "client2"

Boxes are retrieved from Vagrant Cloud.  These templates _MAY_ work with other vagrant boxes, but it hasn't been tested.
## Requirements

* Virtualbox 
* Knowledge of vagrant commands
* Basic knowledge of an ansible project layout
## OS/Vagrant Box/IP Information

| OS         | vagrant box name                         | Private IP Range |Note|
| ---------- | ---------------------------------------- | ---------------- |----|
| ubuntu2004 | jcpetro97/ubuntu2004                     | 192.168.70.[2-4] ||
| ubuntu1804 | jcpetro97/ubuntu1804                     | 192.168.71.[2-4] ||
| centos7    | jcpetro97/centos7                        | 192.168.72.[2-4] ||
| centos8    | jcpetro97/centos8                        | 192.168.73.[2-4] ||
| mixedOS-ub2004    | jcpetro97/[centos7, centos8, ubuntu2004] | 192.168.74.[2-5] |Server is ubuntu2004, the clients are centos7, centos8, ubuntu2004|
| mixedOS-cent7    | jcpetro97/[centos7, centos8, ubuntu2004] | 192.168.75.[2-5] |Server is ubuntu2004, the clients are centos7, centos8, ubuntu2004|
| mixedOS-cent8    | jcpetro97/[centos7, centos8, ubuntu2004] | 192.168.76.[2-5] |Server is ubuntu2004, the clients are centos7, centos8, ubuntu2004|

**NOTE:** If you want a development environment where the control node OS is the same as the clients, those can be found in the **SingleOS** directory

## How to Initialize

* Clone this repository to your local machine
* cd into the OS directory you want to use

_Spin up the ansible server_

* vagrant up <VM name>

ex. `vagrant up server`

**NOTE:** By default, when you spin up the server VM, it will install ansible from the 2.9.x tree.  If you want to use ansible from a different version tree, do the following:

env ANSIBLE_VERSION=<version number> vagrant up server

`env ANSIBLE_VERSION=2.10.4 vagrant up server`

_Spin up clients_

`vagrant up client1`

**NOTE:** If you can put the name of the second client on the command line, just separate the VM names by a space.

## How to use

`/vagrant` is a shared folder, mapped from the host to the guest.  The source of `/vagrant` is the current working directory when the server was initialized.  

A basic ansible project structure is already there and it follows the ansible recommended alternate layout best practices.  

**NOTE:** The layout used, can be used with either the ansible-galaxy method for roles, or the traditional method.  If you are developing for a role to be used with AWX/Tower, then I would recommend the ansible-galaxy method for roles.  See roles/requirements.yml for some detail.

Basically, develop the playbook/role on the host, inside the directory of the OS desired.  To test, spin up the server, and one or both clients.  Log into the "server", cd to /vagrant and run the ansible playbook.

## How to add more clients

* edit the Vagrantfile
* at the end of the file, there is a comment that says `Add more client definitions here`  Beneath that line, paste the following:

```
  config.vm.define :VMNAME do |VMNAME|
    VMNAME.vm.box = "jcpetro97/ubuntu2004"
    VMNAME.vm.hostname = "Change Hostname"
    VMNAME.vm.network "private_network", ip: "ADD IP"
    VMNAME.vm.provider "virtualbox" do |cl2|
      cl2.memory = 1024
      cl2.cpus = 1
      cl2.gui = false
      cl2.name = "VIRTUALBOX VM NAME"
    end
  end
```
* Change any of the fields labled VMNAME, to what the new VM will be called ( ie. client3)
* Change "ADD IP" to the next IP in the private range
* If you want a different OS, change `jcpetro97/ubuntu2004` to another box name from vagrant cloud ( ie. jcpetro97/centos8 or geerlingguy/debian10, etc)
* edit the `./inventory/inventory` file, add the new vm and IP address.
* run `vagrant status` to see if the new VM you want to create is listed
* If there are no errors, run `vagrant up <NEW VM NAME>`

**NOTE:** I currently have the following vagrant boxes hosted at vagrant cloud: jcpetro97/centos7, jcpetro97/centos8, jcpetro97/ubuntu1804, jcpetro97/ubuntu2004.