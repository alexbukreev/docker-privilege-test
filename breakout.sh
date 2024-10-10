#!/bin/bash

# Попытка монтировать файловую систему хоста
echo "Попытка монтировать файловую систему хоста..."
mkdir /mnt/host
mount /dev/sda1 /mnt/host

if [ $? -eq 0 ]; then
  echo "Монтирование успешно, контейнер с привилегиями!"
else
  echo "Не удалось смонтировать, права ограничены."
fi

# Проверка прав sudo
echo "Проверка прав sudo..."
sudo -l

# Попытка доступа к /proc/1/ns/ для проверки namespace
echo "Проверка возможности выйти из namespace..."
ls -l /proc/1/ns/

