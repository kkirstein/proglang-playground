#! /bin/bash

# get files from Windows folder
rsync -auv /vagrant/Hello /home/vagrant/Workspaces --exclude=*~ --exclude=*.swp
chmod 744 -R /home/vagrant/Workspaces/Hello

