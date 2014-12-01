#!/bin/bash

echo "Adding box..."
sudo vagrant box add preconfigured_vm package.box
echo "Initializing preconfigured VM..."
sudo vagrant init preconfigured_vm

echo "Copying Vagrantfile and run script..."
sudo cp -f Vagrantfile /.CrowdCrunch/Vagrantfile
sudo cp -f run.sh /.CrowdCrunch/run.sh

#make sure vm only runs when resources are not otherwise in use
#nice -n 19 <ENTER VM NAME HERE>;
#not sure where this vm will be installed :/

echo "Setting Permissions..."
cd /.CrowdCrunch
sudo chown -R $USER ~/.vagrant.d
sudo chown -R $USER /.CrowdCrunch/
echo "Starting Vagrant Up..."
sudo vagrant up
echo "Starting Vagrant Halt..."
sudo vagrant halt

echo "Removing package..."
sudo rm -rf package.box
sudo chown -R $USER /.CrowdCrunch/

echo "Post Install Complete"
