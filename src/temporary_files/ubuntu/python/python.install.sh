#!/bin/bash

# Проверка, запущен ли скрипт с правами суперпользователя
if [ "$EUID" -ne 0 ]; then
  echo "Пожалуйста, запустите этот скрипт с правами суперпользователя (sudo)."
  exit 1
fi

# Обновление списка пакетов
echo "Обновление списка пакетов..."
apt update -y

# Установка Python 3
echo "Установка Python 3..."
apt install python3 -y

# Установка pip
echo "Установка pip..."
apt install python3-pip -y

# Установка виртуального окружения
echo "Установка python3-venv..."
apt install python3-venv -y

echo "Установка завершена! Проверка версий..."

# Проверка установленных версий
python3 --version
pip3 --version

echo "Python и pip успешно установлены!"
