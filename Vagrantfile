# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$init = <<SCRIPT
sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "ubuntu/trusty32"
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "ionic-android"

  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, run: "always", inline: $init

  config.vm.network "forwarded_port", guest: 8100, host: 8100
  config.vm.network "forwarded_port", guest: 35729, host: 35729
  config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.synced_folder "../data", "/vagrant_data"
  #config.vm.synced_folder "projects", "/home/vagrant/projects"
  config.vm.synced_folder "ionic-projects/", "/ionic-projects", create: true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--usb", "on"]
    #vb.customize ["usbfilter", "add", "0", "--target", :id, "1197123b", "--vendorid", "0x04e8"]
    vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
    ## Don't boot with headless mode
    #vb.gui = true
    #
    ## Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

end
