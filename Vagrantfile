# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

VAGRANT_BOX         = "generic/ubuntu2004"
VAGRANT_BOX_VERSION = "4.2.6"
# master nodes
MASTER_NODE_COUNT   = 1
MASTER_NODE_CPUS    = 2
MASTER_NODE_MEMORY  = 8196

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  (1..MASTER_NODE_COUNT).each do |i|

    config.vm.define "jenkin0#{i}" do |node|

      node.vm.box               = VAGRANT_BOX
      node.vm.box_check_update  = false
      node.vm.box_version       = VAGRANT_BOX_VERSION
      node.vm.hostname          = "jenkin0#{i}.example.com"

      node.vm.network "private_network", ip: "172.16.16.237"

      node.vm.provider :virtualbox do |v|
        v.name    = "jenkin0#{i}"
        v.memory  = MASTER_NODE_MEMORY
        v.cpus    = MASTER_NODE_CPUS
      end

    end

  end

end

