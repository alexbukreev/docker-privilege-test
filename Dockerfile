# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Устанавливаем необходимые утилиты для тестирования
RUN apt-get update && apt-get install -y \
    curl \
    net-tools \
    iproute2 \
    iputils-ping \
    procps \
    vim \
    gcc \
    gdb \
    sudo

# Создаем скрипт для проверки привилегий
COPY breakout.sh /breakout.sh
RUN chmod +x /breakout.sh

# Запускаем bash для интерактивной работы
CMD ["/bin/bash"]

