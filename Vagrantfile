# -*- mode: ruby -*-
# vi: set ft=ruby :
DEBIAN10_IMAGE = "jcpetro97/debian10"
DEBIAN11_IMAGE = "jcpetro97/debian11"
UBUNTU2004_IMAGE = "jcpetro97/ubuntu2004"
UBUNTU2204_IMAGE = "jcpetro97/ubuntu2204"
CENTOS7_IMAGE = "jcpetro97/centos7"
ROCKY8_IMAGE = "jcpetro97/rocky8"
ROCKY9_IMAGE = "jcpetro97/rocky9"
# valid subnets are 192.168.56 -> 192.168.63. See README.md on adding different subnets.
SUBNET = "192.168.56"
Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  
# ubuntu control node
  config.vm.define :"ubuntu-controlnode" do |ubcn|
    ubcn.vm.box = UBUNTU2004_IMAGE
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
# # centos7 control node
#   config.vm.define :"centos7-controlnode" do |c7cn|
#     c7cn.vm.box = CENTOS7_IMAGE
#     c7cn.vm.hostname = "centos7-controlnode"
#     c7cn.vm.network "private_network", ip: "#{SUBNET}.3"
#     c7cn.vm.provider "virtualbox" do |vb|
#       vb.memory = 2048
#       vb.cpus = 2
#       vb.gui = false
#     end #vb
#     c7cn.vm.synced_folder '.', '/vagrant', disabled: false
#     c7cn.vm.provision :hosts, :sync_hosts => true
#     c7cn.vm.provision "shell" do |s|
#       s.inline = $centinstall
#       s.env   = {ANSIBLE_VERSION:ENV['ANSIBLE_VERSION']}
#     end # s
#   end # c7cn  
# rocky8 control node
  config.vm.define :"rocky8-controlnode" do |r8cn|
    r8cn.vm.box = ROCKY8_IMAGE
    r8cn.vm.hostname = "rocky8-controlnode"
    r8cn.vm.network "private_network", ip: "#{SUBNET}.3"
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
  end # rocky8 control node  
 # rocky9 control node
 config.vm.define :"rocky9-controlnode" do |r9cn|
  r9cn.vm.box = ROCKY9_IMAGE
  r9cn.vm.hostname = "rocky9-controlnode"
  r9cn.vm.network "private_network", ip: "#{SUBNET}.4"
  r9cn.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
    vb.gui = false
  end #vb
  r9cn.vm.synced_folder '.', '/vagrant', disabled: false
  r9cn.vm.provision :hosts, :sync_hosts => true
  r9cn.vm.provision "shell" do |s|
    s.inline = $centinstall
    s.env   = {ANSIBLE_VERSION:ENV['ANSIBLE_VERSION']}
  end # s
end # rocky9 controlnode  

# ubuntu2004 nodes
  (1..2).each do |i|     
    config.vm.define "ubuntu2004-node#{i}" do |ubuntu2004|
        ubuntu2004.vm.box = UBUNTU2004_IMAGE 
        ubuntu2004.vm.hostname = "ubuntu2004-node#{i}"       
        ubuntu2004.vm.network :private_network, ip: "#{SUBNET}.#{i + 10}"
        ubuntu2004.vm.provision :hosts, :sync_hosts => true
        ubuntu2004.vm.synced_folder '.', '/vagrant', disabled: true
    end # end ubuntu2004
  end  # end each loop
# ubuntu2204 nodes
    (1..2).each do |i|     
      config.vm.define "ubuntu2204-node#{i}" do |ubuntu2204|
        ubuntu2204.vm.box = UBUNTU2204_IMAGE 
        ubuntu2204.vm.hostname = "ubuntu2204-node#{i}"       
        ubuntu2204.vm.network :private_network, ip: "#{SUBNET}.#{i + 20}"
        ubuntu2204.vm.provision :hosts, :sync_hosts => true
        ubuntu2204.vm.synced_folder '.', '/vagrant', disabled: true
      end # end ubuntu2204
    end  # end each loop
# centos7 nodes
  (1..2).each do |i|     
    config.vm.define "centos7-node#{i}" do |centos7|
        centos7.vm.box = CENTOS7_IMAGE
        centos7.vm.hostname = "centos7-node#{i}"       
        centos7.vm.network :private_network, ip: "#{SUBNET}.#{i + 30}"     
        centos7.vm.provision :hosts, :sync_hosts => true
        centos7.vm.synced_folder '.', '/vagrant', disabled: true
    end # end centos7
  end # end each loop  
# rocky8 nodes
  (1..2).each do |i|     
    config.vm.define "rocky8-node#{i}" do |rocky8|
        rocky8.vm.box = ROCKY8_IMAGE
        rocky8.vm.hostname = "rocky8-node#{i}"       
        rocky8.vm.network :private_network, ip: "#{SUBNET}.#{i + 40}"     
        rocky8.vm.provision :hosts, :sync_hosts => true
        rocky8.vm.synced_folder '.', '/vagrant', disabled: true
    end # end rocky8 node
  end # end each loop
# rocky9 nodes
(1..2).each do |i|     
  config.vm.define "rocky9-node#{i}" do |rocky9|
      rocky9.vm.box = ROCKY9_IMAGE
      rocky9.vm.hostname = "rocky9-node#{i}"       
      rocky9.vm.network :private_network, ip: "#{SUBNET}.#{i + 50}"     
      rocky9.vm.provision :hosts, :sync_hosts => true
      rocky9.vm.synced_folder '.', '/vagrant', disabled: true
  end # end rocky9 node
end # end each loop
# debian10 nodes
  (1..2).each do |i|     
    config.vm.define "debian10-node#{i}" do |debian10|
      debian10.vm.box = DEBIAN10_IMAGE
      debian10.vm.hostname = "debian10-node#{i}"       
      debian10.vm.network :private_network, ip: "#{SUBNET}.#{i + 60}"     
      debian10.vm.provision :hosts, :sync_hosts => true
      debian10.vm.synced_folder '.', '/vagrant', disabled: true
    end # end debian10 node
  end # end each loop
# debian11 nodes
(1..2).each do |i|     
  config.vm.define "debian11-node#{i}" do |debian11|
    debian11.vm.box = DEBIAN11_IMAGE
    debian11.vm.hostname = "debian11-node#{i}"       
    debian11.vm.network :private_network, ip: "#{SUBNET}.#{i + 70}"     
    debian11.vm.provision :hosts, :sync_hosts => true
    debian11.vm.synced_folder '.', '/vagrant', disabled: true
  end # end debian10 node
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
