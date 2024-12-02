sudo ufw status verbose
sudo ufw enable
sudo ufw default allow outgoing
sudo ufw default allow incoming
sudo ufw allow https
sudo ufw allow ssh
sudo ufw allow 22/tcp
sudo ufw reload