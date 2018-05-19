#!/bin/bash

source ~/.rvm/scripts/rvm

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install

rvm alias create reddit ruby-2.4.1
sed -i '1c#!\/bin\/bash'  ~/.rvm/wrappers/reddit/bundle
#puma -d
sudo cp ~/reddit/scripts/puma.service /etc/systemd/system
sudo systemctl enable puma.service
sudo systemctl start puma.service

