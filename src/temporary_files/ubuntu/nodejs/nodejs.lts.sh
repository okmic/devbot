#!/bin/bash
set -e # Прерывать выполнение при ошибках

echo -e "\033[1;36m=== Установка Node.js, npm, Yarn и PM2 на чистую Ubuntu ===\033[0m"

# 1. Обновление индексов пакетов
sudo apt update -qq
echo -e "\033[1;32m✓ Обновление пакетов выполнено\033[0m"

# 2. Установка зависимостей
sudo apt install -y curl git > /dev/null
echo -e "\033[1;32m✓ Зависимости установлены\033[0m"

# 3. Установка Node.js 20 LTS через официальный бинарник
echo -e "\033[1;33mУстанавливаем Node.js 20 LTS...\033[0m"
NODE_VERSION="v20.12.2"
curl -fsSL "https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz" | \
  sudo tar -xJ -C /usr/local --strip-components=1
echo -e "\033[1;32m✓ Node.js $NODE_VERSION установлен\033[0m"

# 4. Установка глобальных пакетов
echo -e "\033[1;33mУстанавливаем npm, Yarn и PM2...\033[0m"
sudo npm install -g npm@latest yarn pm2 --silent
echo -e "\033[1;32m✓ Глобальные пакеты установлены\033[0m"

# 5. Проверка версий
echo -e "\n\033[1;35m=== Установленные версии ===\033[0m"
echo "Node.js: $(node -v)"
echo "npm:    $(npm -v)"
echo "Yarn:   $(yarn -v)"
echo "PM2:    $(pm2 -v)"

echo -e "\n\033[1;32m✔ Все компоненты успешно установлены!\033[0m"
