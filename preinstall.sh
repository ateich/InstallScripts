#!/bin/bash

#install vagrant
sudo -S installer -verbose -pkg Vagrant.pkg -target /;

#install virtualbox
if type vboxmanage > /dev/null; then
  echo 'vbox already installed';
  #for VM in `VBoxManage list runningvms | awk '{ print $2; }'`; do VBoxManage controlvm $VM poweroff; done
else
  sudo -S installer -verbose -pkg VirtualBox.pkg -target /;
fi

#move vagrant package to /.CrowdCrunch
sudo mkdir -m 777 /.CrowdCrunch
sudo cp package.box /.CrowdCrunch/package.box
cd /.CrowdCrunch
#vagrant init preconfigured_vm package.box 
#sudo rm -rf package.box
