dbName="admin"
userName="admin"
userPassword="password"
ip="%"

mysql -u root -p <<EOF
CREATE USER '$userName'@'$ip' IDENTIFIED BY '$userPassword';
GRANT ALL PRIVILEGES ON $dbName.* TO '$userName'@'$ip';
FLUSH PRIVILEGES;
EOF


