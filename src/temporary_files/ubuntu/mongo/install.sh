#!/bin/bash

# Убедитесь, что вы запускаете этот скрипт с правами суперпользователя
if [ "$EUID" -ne 0 ]; then
    echo "Пожалуйста, запустите этот скрипт с правами суперпользователя (sudo)."
    exit
fi

# Установка необходимых пакетов
echo "Установка необходимых пакетов..."
apt update
apt install -y software-properties-common gnupg apt-transport-https ca-certificates curl

# Импорт публичного ключа MongoDB
echo "Импорт публичного ключа MongoDB..."
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | gpg --dearmor | tee /usr/share/keyrings/mongodb-server-7.0.gpg > /dev/null

# Добавление репозитория MongoDB
echo "Добавление репозитория MongoDB..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Обновление списка пакетов
echo "Обновление списка пакетов..."
apt update

# Установка MongoDB
echo "Установка MongoDB..."
apt install -y mongodb-org

# Запуск службы MongoDB
echo "Запуск службы MongoDB..."
systemctl start mongod

# Включение автоматического запуска при загрузке
echo "Включение автоматического запуска MongoDB при загрузке..."
systemctl enable mongod

# Проверка статуса службы MongoDB
echo "Проверка статуса службы MongoDB..."
systemctl status mongod --no-pager

echo "MongoDB успешно установлен и запущен!"
