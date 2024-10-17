# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Устанавливаем необходимые утилиты для тестирования и SSH-сервер
RUN apt-get update && apt-get install -y \
    curl \
    net-tools \
    iproute2 \
    iputils-ping \
    procps \
    vim \
    gcc \
    gdb \
    sudo \
    openssh-server

# Настраиваем SSH
RUN mkdir /var/run/sshd
RUN mkdir -p /root/.ssh

# Копируем публичный ключ для аутентификации по ключу
COPY id_rsa.pub /root/.ssh/authorized_keys

# Настройки SSH для использования ключа
RUN chmod 600 /root/.ssh/authorized_keys
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

# Добавляем перезапуск SSH-сервера
RUN service ssh restart

# Открываем порт 22 для SSH
EXPOSE 22

# Запускаем SSH-сервер
CMD ["/usr/sbin/sshd", "-D"]
