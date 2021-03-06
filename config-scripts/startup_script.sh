#!/bin/bash

#install ruby
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

#check ruby installed
ruby -v
bundler -v

#install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

sudo apt update
sudo apt install -y mongodb-org

sudo systemctl start mongod
sudo systemctl enable mongod

#check mongodb installed
sudo systemctl status mongod

#deploy
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

puma -d

#check deployment
ps aux | grep puma
