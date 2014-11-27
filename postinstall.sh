#!/bin/bash

sudo cp -f Vagrantfile /.CrowdCrunch/Vagrantfile
sudo cp -f run.sh /.CrowdCrunch/run.sh

#make sure vm only runs when resources are not otherwise in use
#nice -n 19 <ENTER VM NAME HERE>;
#not sure where this vm will be installed :/
