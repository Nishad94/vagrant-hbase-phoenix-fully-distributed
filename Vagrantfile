# -*- mode: ruby -*-
# vi: set ft=ruby :

# Before running vagrant up, make sure you have hadoop-2.7.3 folder downloaded from apache source present in cwd
# After doing vagrant up, run steps to allow ssh access from each machine to the other including itself.
# Similar to hostname_server in repo, change /etc/hosts in all VMs and change /etc/hostname to reflect its FQDN
# Copy slaves file in repository to ResourceManager's $HADOOP_PREFIX/etc/hadoop
# To run hdfs: $HADOOP_PREFIX/sbin/start-all.sh from the worker1 machine which has the ResourceManager
# BEFORE RUNNING ON NAMENODE:
        # Format the namenode directory (DO THIS ONLY ONCE, THE FIRST TIME)
        # ONLY ON THE NAMENODE NODE
        #$HADOOP_PREFIX/bin/hdfs namenode -format
# http://www.alexjf.net/blog/distributed-systems/hadoop-yarn-installation-definitive-guide/
# Check web ui: http://192.168.33.10:50070/dfshealth.html#tab-overview , http://192.168.33.11:8088/cluster/nodes

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
      v.memory = 2048
  end

  config.vm.provision "shell" do |s|
    s.path = "provision_hadoop_hbase.sh"
  end

  config.vm.define "server", primary:true do |server|
    server.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define "worker1" do |worker1|
    worker1.vm.network :private_network, ip: "192.168.33.11"
  end

  config.vm.define "worker2" do |worker2|
    worker2.vm.network :private_network, ip: "192.168.33.12"
  end
end
