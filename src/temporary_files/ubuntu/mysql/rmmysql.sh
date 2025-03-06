sudo systemctl stop mysql
sudo apt-get purge -y mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*
sudo rm -rf -y /etc/mysql /var/lib/mysql /var/log/mysql
sudo apt autoremove -y
sudo apt autoclean -y

sudo apt update -y
sudo apt upgrade -y
echo "Mysql was deleted"