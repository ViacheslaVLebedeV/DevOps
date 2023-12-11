# DevOps

## Важные команды
hostnamectl - утилита для управления системными параметрами и настройками хоста в системах
с systemd

set-hostnamectl - подкоманда для установки имени хоста

sudo usermod -aG  - для изменения атрибутов пользователя
флаги -aG говорят о 1) добавлении к группе 2) без удаления из других групп

sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
1) sed потоковое редактирование
2) -i изменения на месте (без создания временного файла)
3) s/ начало поисковой строки
4) / конец поисковой и сразу после начало заменяемой
5) / конец заменяемой строки
6) /etc/ssh/sshd_config путь файла, в котором нужно произвести замену


