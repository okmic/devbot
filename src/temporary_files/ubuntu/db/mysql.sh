

sudo apt update -y
sudo apt upgrade -y

sudo apt install mysql-server -y

sudo mysql_secure_installation

sudo echo -e "[mysqld]
max_connections=10000" > /etc/mysql/conf.d/max_connections.cnf 

sudo systemctl restart mysql.service

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
SHOW VARIABLES LIKE 'max_connections';
EOF


