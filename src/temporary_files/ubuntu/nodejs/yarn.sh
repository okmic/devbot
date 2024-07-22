sudo apt update
sudo curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install -y yarn
sudo sudo curl --compressed -o- -L -y https://yarnpkg.com/install.sh | bash
yarn --version