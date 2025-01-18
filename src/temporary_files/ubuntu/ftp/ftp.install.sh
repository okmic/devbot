#!/bin/bash

echo "Обновление списка пакетов..."
sudo apt update

echo "Установка FileZilla..."
sudo apt install -y filezilla

echo "Установка завершена!"
