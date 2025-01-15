#!/bin/bash

# Обновление пакетов
sudo apt update
sudo apt upgrade -y

# Установка OpenSSH-сервера, если он не установлен
if ! dpkg -l | grep -q openssh-server; then
    echo "Установка OpenSSH-сервера..."
    sudo apt install -y openssh-server
fi

# Создание каталога .ssh, если он не существует
if [ ! -d "$HOME/.ssh" ]; then
    echo "Создание каталога .ssh..."
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
fi

# Создание файла authorized_keys, если он не существует
if [ ! -f "$HOME/.ssh/authorized_keys" ]; then
    echo "Создание файла authorized_keys..."
    touch "$HOME/.ssh/authorized_keys"
    chmod 600 "$HOME/.ssh/authorized_keys"
fi

# Настройка sshd_config
echo "Настройка sshd_config..."
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Перезапуск SSH-сервера
echo "Перезапуск SSH-сервера..."
sudo systemctl restart ssh

echo "Настройка завершена. Теперь вы можете добавить свой публичный SSH-ключ в файл authorized_keys."
