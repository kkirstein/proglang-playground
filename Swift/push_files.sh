#! /bin/bash

# push files to Windows folder
rsync -auv /home/vagrant/Workspaces/Hello /vagrant --exclude=*~ --exclude=*.swp --exclude=.build

