#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Пожалуйста, запустите этот скрипт с правами суперпользователя (sudo)."
    exit
fi

sudo apt update

sudo apt install -y nginx

sudo systemctl start nginx

sudo systemctl enable nginx

sudo systemctl status nginx
