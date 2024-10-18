FROM alpine:latest

# Устанавливаем необходимые пакеты
RUN apk --no-cache add tinyproxy

# Копируем конфигурационный файл
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Экспонируем порт 8888
EXPOSE 8888

# Запускаем TinyProxy
CMD ["tinyproxy", "-d"]
