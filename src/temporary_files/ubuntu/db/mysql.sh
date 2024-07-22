

sudo apt update -y
sudo apt upgrade -y

sudo apt install mysql-server -y

sudo mysql_secure_installation

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'f32eJ&Jr3f@kLRD';
SET GLOBAL max_connections = 10000;
EOF
