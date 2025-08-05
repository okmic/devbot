#!/bin/bash

sudo apt update

sudo apt install -y curl

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo npm install -g npm@latest

sudo npm install -g yarn

sudo npm install -g pm2

echo "Node.js version:"
node -v
echo "npm version:"
npm -v
echo "Yarn version:"
yarn -v
echo "pm2 version:"
pm2 -v
