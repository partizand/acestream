docker acestream debian
=======================

* Try create minimal image size for acestream
* Don't contain aceproxy and supervisord
* May be outdate.

Install
-------


Get docker

```
git clone https://github.com/partizand/acestream.git
cd acestream/docker
```

Build docker image "acestream-deb"

```
docker build --no-cache -t acestream-deb .
```

Create docker container "acestream" (with restart after reboot and reload on error)

```bash
docker create -p 6878:6878 --restart unless-stopped --name acestream acestream-deb
```

Start docker container

```bash
docker start acestream
```

Описание
--------


Образ docker для движка acestream в debian

Основные цели

* Поиграться с докером
* Сделать образ мнимального размера
* выкинуть aceproxy и supervisord

Начиная с версии 3.1 acestream содержит свой прокси, которого достаточно для работы на той же машине

На alpine сделать не получилось, заморочка с зависимостями glibc

Установка
---------

* Установка dockera описана тут https://docs.docker.com/engine/installation/

* Построение образа 

```bash
cd [каталог с dockerfile]
docker build --no-cache -t acestream-deb .
```

* Создание контейнера (с перезапуском после перезагрузки или внезапной остановки)

```bash
docker create -p 6878:6878 --restart unless-stopped --name acestream acestream-deb
```

* Запуск контейнера

```bash
docker start acestream
```

Ссылки
------

* Дистрибутивы acestream http://wiki.acestream.org/wiki/index.php/Download

* Инструкции по установке http://wiki.acestream.org/wiki/index.php/Install_Ubuntu

* Форум про установку версии 3.1 http://forum.torrentstream.org/index.php?topic=12086.0






 
