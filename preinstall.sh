#!/bin/bash

#only install boot2docker if the user does not have it
if type boot2docker > /dev/null; then

  # turn off boot2docker if it is on
  if [ $(boot2docker status) != "poweroff" ]; then
    boot2docker stop;
    echo 'stopped boot2docker';
  fi

  echo 'boot2docker already installed';  
  
  #turn off all VMs
  if type vboxmanage > /dev/null; then
    echo 'vbox already installed';
    for VM in `VBoxManage list runningvms | awk '{ print $2; }'`; do VBoxManage controlvm $VM poweroff; done
  fi
  
#they don't have boot2docker, install it
else
  sudo -S installer -verbose -pkg ../Boot2Docker.pkg -target /;
fi


#install vagrant
sudo -S installer -verbose -pkg ../Vagrant.pkg -target /;
