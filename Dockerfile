# Используем базовый образ Ubuntu
FROM ubuntu:22.04

# Обновляем пакеты и устанавливаем tinyproxy
RUN apt-get update && apt-get install -y tinyproxy && apt-get clean

# Создаем необходимые директории для логов и PID-файлов (если требуется)
RUN mkdir -p /var/log/tinyproxy /var/run/tinyproxy

# Копируем конфигурацию tinyproxy
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Экспонируем порт 8888
EXPOSE 8888

# Запускаем tinyproxy в foreground (без "-d")
CMD ["tinyproxy"]
