# Тренировки по DevOps, задачи 1ой недели

## 1. Решить 10 простых задачек с https://leetcode.com

## 2. В терминале открыть bash, в нем выполнить команду ls -l. 
Ваша задача разобраться с тем, как работает sed, и с его помощью добавить по пробелу в начало каждой строки вывода ls -l. Например, из «drwxr-xr-x ...» должно получиться « drwxr-xr-x ...» (с пробелом в начале).

Консоль:
```
ls -l | sed 's/^/ /'
```
* Пояснение: вывод команды ls -l мы изменяем командой sed с параметром s, что значит замену. Значок ^ является якорным знаком, означающим начало строки. После слэша идёт пробел, что значит замену самого начала строки на её же, но с пробелом.

Задача со звездочкой – сделать то же самое с помощью awk.

Консоль:
```
ls -l | awk '{sym=" "; print sym $0}'
```

* Пояснение: вывод команды ls -l мы с помощью языка программирования awk дополняем выводом сначала переменной sym, в которой лежит символ пробела, а потом выводим всю строку с помощью $0.
* Вообще можно создать файл script, куда положить сам код на языке awk а в терминале просто указать его исполняемым файлом (на этот случай это не так и нужно, но вот для более изощрённых кейсов очень полезно будет.

nano testfile:
```
{
symbol = " "
print symbol $0
}
```
консоль:
```
ls -l | awk -f testfile
```
* С помощью флага -f задаётся файл со скриптом awk.

## 3. Почитать в интернете про аппаратные возможности современных серверов. Цель задачи — понимать масштабы современного оборудования.
* Какого размера актуальные диски HDD/NVMe/SSD?
* Сколько ядер CPU, оперативной памяти сейчас в топовом сервере?
* Кто сейчас впереди, Intel или AMD?
* Сколько и каких видеокарт можно установить в сервер?
* Какую максимальную скорость сети можно получить на сервере?

## 4. Запустить локально на своем ПК, или в виртуальной машине minikube(либо аналог):
* найти в интернете тестовый deployment - поискать в Яндексе «как установить
minikube»
* выполнить найденные инструкции, получив работоспособную систему
* проверить работоспособность с помощью консольной утилиты curl или в браузере.

## 5. Посмотреть на роадмапы https://roadmap.sh Найти темы, которые вам нужно подтянуть или
в которые стоит углубиться. Из этих тем найти одну или две первоочередные.
Запланировать изучение :)
