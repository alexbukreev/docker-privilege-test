# Используем базовый образ Python
FROM python:3.12

# Устанавливаем tinyproxy через apt
RUN apt-get update && apt-get install -y tinyproxy && apt-get clean

# Копируем конфигурацию tinyproxy
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Запускаем tinyproxy
CMD ["tinyproxy", "-d"]

# Экспонируем порт 8888
EXPOSE 8888


