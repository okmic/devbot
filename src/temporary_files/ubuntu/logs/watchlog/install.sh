#!/bin/bash

# Проверяем, запущен ли скрипт с правами суперпользователя
if [[ $EUID -ne 0 ]]; then
   echo "Этот скрипт необходимо запускать с правами суперпользователя (sudo)." 
   exit 1
fi

# Обновляем список пакетов
echo "Обновляем список пакетов..."
apt-get update

# Устанавливаем необходимые зависимости (если нужно)
echo "Устанавливаем зависимости..."
apt-get install -y curl

# Устанавливаем watchlog
echo "Устанавливаем watchlog..."
# Замените на правильный URL
curl -sSL https://raw.githubusercontent.com/username/repo/branch/path/to/watchlog/install.sh | bash

# Проверяем установку
if command -v watchlog &> /dev/null; then
    echo "watchlog успешно установлен!"
else
    echo "Ошибка: watchlog не удалось установить."
    exit 1
fi

echo "Установка завершена."
