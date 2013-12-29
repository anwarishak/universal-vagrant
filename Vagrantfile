# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Basic box
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Networking: port forwarding
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true

  # Synced folders
  config.vm.synced_folder "./", "/universal-vagrant"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "off"]
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision :shell, :path => "scripts/bootstrap.sh"
  config.vm.provision :shell, :path => "scripts/apache.sh"
  config.vm.provision :shell, :path => "scripts/mysql.sh"
  config.vm.provision :shell, :path => "scripts/php.sh"

end
