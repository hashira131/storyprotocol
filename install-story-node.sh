#!/bin/bash

set -e

echo "Обновляем систему и устанавливаем зависимости..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git build-essential

echo "Устанавливаем Go..."
wget https://golang.org/dl/go1.19.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc

echo "Клонируем репозиторий Story Protocol..."
git clone https://github.com/StoryProtocol/story-node.git
cd story-node

echo "Собираем проект..."
make build

echo "Запускаем ноду..."
./storyd start

echo "Установка завершена."
