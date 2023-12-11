#Строка  сообщает ОС, какую командную оболочку использовать для скрипта
#!/bin/bash

# Обновление пакетов
sudo apt update
sudo apt upgrade -y

# Установка необходимых пакетов и программ
sudo apt install -y openssh-server

# Настройка сети
sudo hostnamectl set-hostname myserver

# Создание пользователя и установка пароля
sudo adduser newuser
sudo usermod -aG sudo newuser

# Конфигурирование (отключение входа под учётной записью root)
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
# Перезапуск службы SSH
sudo systemctl restart ssh

echo "Система настроена!"
