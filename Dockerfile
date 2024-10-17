# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Устанавливаем только SSH-сервер
RUN apt-get update && apt-get install -y \
    openssh-server

# Настраиваем SSH
RUN mkdir /var/run/sshd

# Устанавливаем пароль для root (замени 'password' на нужный пароль)
RUN echo 'root:jujkjUju6' | chpasswd

# Включаем возможность логина по паролю
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Открываем порт 22 для SSH
EXPOSE 22

# Запускаем SSH-сервер
CMD ["/usr/sbin/sshd", "-D"]
