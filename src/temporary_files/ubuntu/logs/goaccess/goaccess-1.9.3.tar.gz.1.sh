#!/bin/bash

# Обновляем список пакетов
sudo apt update

# Устанавливаем необходимые пакеты без подтверждения
sudo apt install -y build-essential libncurses5-dev libgeoip-dev libssl-dev libglib2.0-dev

# Скачиваем последнюю версию GoAccess
wget https://tar.goaccess.io/goaccess-1.9.3.tar.gz

# Распаковываем архив
tar -xzvf goaccess-1.9.3.tar.gz
cd goaccess-1.9.3

# Конфигурируем, компилируем и устанавливаем
./configure --enable-utf8 --with-geolite2=legacy
make
sudo make install

mkdir /var/www/html/logs
touch /var/www/html/logs/index.html
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Проверяем установленную версию GoAccess
goaccess --version
