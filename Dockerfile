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

# Устанавливаем пароль для root пользователя (замени 'password' на желаемый пароль)
RUN echo 'root:jujk_jUju6' | chpasswd

# Включаем возможность логина по паролю
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Открываем порт 22 для SSH
EXPOSE 22

# Запускаем SSH-сервер
CMD ["/usr/sbin/sshd", "-D"]
