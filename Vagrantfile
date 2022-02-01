# -*- mode: ruby -*-
# vi: set ft=ruby :

UBUNTU_IMAGE = "jcpetro97/ubuntu2004"
CENTOS7_IMAGE = "jcpetro97/centos7"
ROCKY8_IMAGE = "jcpetro97/rocky8"
# valid subnets are 192.168.56 -> 192.168.63. See README.md on adding different subnets.
SUBNET = "192.168.56"
Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  
  # ubuntu control node
  config.vm.define :"ubuntu-controlnode" do |ubcn|
    ubcn.vm.box = UBUNTU_IMAGE
    ubcn.vm.hostname = "ubuntu-controlnode"
    ubcn.vm.network "private_network", ip: "#{SUBNET}.2"
    ubcn.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.gui = false
    end #vb
    ubcn.vm.synced_folder '.', '/vagrant', disabled: false
    ubcn.vm.provision :hosts, :sync_hosts => true
    ubcn.vm.provision "shell" do |s|
      s.inline = $ubinstall
      s.env   = {ANSIBLE_VERSION:ENV['ANSIBLE_VERSION']}
    end # s
  end # ubcn
  
  # centos7 control node
  config.vm.define :"centos7-controlnode" do |c7cn|
    c7cn.vm.box = CENTOS7_IMAGE
    c7cn.vm.hostname = "centos7-controlnode"
    c7cn.vm.network "private_network", ip: "#{SUBNET}.3"
    c7cn.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.gui = false
    end #vb
    c7cn.vm.synced_folder '.', '/vagrant', disabled: false
    c7cn.vm.provision :hosts, :sync_hosts => true
    c7cn.vm.provision "shell" do |s|
      s.inline = $centinstall
      s.env   = {ANSIBLE_VERSION:ENV['ANSIBLE_VERSION']}
    end # s
  end # c7cn
  
  # centos8 control node
  config.vm.define :"rocky8-controlnode" do |r8cn|
    r8cn.vm.box = ROCKY8_IMAGE
    r8cn.vm.hostname = "rocky8-controlnode"
    r8cn.vm.network "private_network", ip: "#{SUBNET}.4"
    r8cn.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.gui = false
    end #vb
    r8cn.vm.synced_folder '.', '/vagrant', disabled: false
    r8cn.vm.provision :hosts, :sync_hosts => true
    r8cn.vm.provision "shell" do |s|
      s.inline = $centinstall
      s.env   = {ANSIBLE_VERSION:ENV['ANSIBLE_VERSION']}
    end # s
  end # c8cn
  
  # ubuntu nodes
  (1..2).each do |i|     
    config.vm.define "ubuntu-node#{i}" do |ubuntu|
        ubuntu.vm.box = UBUNTU_IMAGE 
        ubuntu.vm.hostname = "ubuntu-node#{i}"       
        ubuntu.vm.network :private_network, ip: "#{SUBNET}.#{i + 10}"
        ubuntu.vm.provision :hosts, :sync_hosts => true
    end # end ubuntu
  end  # end each loop

  # centos7 nodes
  (1..2).each do |i|     
    config.vm.define "centos7-node#{i}" do |centos7|
        centos7.vm.box = CENTOS7_IMAGE
        centos7.vm.hostname = "centos7-node#{i}"       
        centos7.vm.network :private_network, ip: "#{SUBNET}.#{i + 20}"     
        centos7.vm.provision :hosts, :sync_hosts => true
    end # end centos7
  end # end each loop
  
  # rocky8 nodes
  (1..2).each do |i|     
    config.vm.define "rocky8-node#{i}" do |rocky8|
        rocky8.vm.box = ROCKY8_IMAGE
        rocky8.vm.hostname = "rocky8-node#{i}"       
        rocky8.vm.network :private_network, ip: "#{SUBNET}.#{i + 30}"     
        rocky8.vm.provision :hosts, :sync_hosts => true
    end # end centos8 node
  end # end each loop
end # config
$ubinstall = <<UBSCRIPT
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
  if [ -z "${ANSIBLE_VERSION}" ];

    then
        /bin/echo "------> Install Latest Version of Ansible  <------"
        /usr/bin/python3 -m pip install ansible
    elif [[ $ANSIBLE_VERSION =~ "2.10" ]]
    then
        /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
        /usr/bin/python3 -m pip install ansible-base==$ANSIBLE_VERSION
    else
        /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
        /usr/bin/python3 -m pip install ansible==$ANSIBLE_VERSION
    fi
    
  #
  /bin/echo "------> Verify Ansible Version <------"
  /usr/local/bin/ansible --version
UBSCRIPT

$centinstall = <<CENTSCRIPT
  #!/bin/bash
  # Install Python.
  /usr/bin/echo "------> installing python3 <------"
  /usr/bin/yum -y install python3 python3-pip sshpass
  /usr/bin/echo "------> upgrade pip <------"
  /usr/bin/python3 -m pip install --upgrade pip
  /usr/bin/echo "------> upgrade setuptools <------"
  /usr/bin/python3 -m pip install --upgrade setuptools
  # Install Ansible.
  if [ -z "${ANSIBLE_VERSION}" ];
    then
        /bin/echo "------> Install Latest Version of Ansible  <------"
        /usr/bin/python3 -m pip install ansible
    elif [[ $ANSIBLE_VERSION =~ "2.10" ]]
    then
        /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
        /usr/bin/python3 -m pip install ansible-base==$ANSIBLE_VERSION
    else
        /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
        /usr/bin/python3 -m pip install ansible==$ANSIBLE_VERSION
    fi
  # 
  /usr/bin/echo "------> Verify Ansible Version <------"
  /usr/local/bin/ansible --version
CENTSCRIPT
