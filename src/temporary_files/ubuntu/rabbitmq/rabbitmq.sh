sudo apt update -y

wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb -y
sudo dpkg -i -y erlang-solutions_2.0_all.deb 
sudo apt update -y

sudo apt install -y erlang 
sudo apt install -y rabbitmq-server

sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server

sudo systemctl status rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management

echo default login and password guest