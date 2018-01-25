Install script acestream on Ubuntu
==================================

Install acestream engine on Ubuntu 16.04

* Loads binaries from official site
* Install dependies
* Create system user and group `acestream`
* Create and start systemd service `acestream`

Install
-------

Copy files into dir, then run `ace-install.sh`

Commands
--------

Stop `sudo systemctl stop acestream`

Start `sudo systemctl start acestream`

Status `sudo systemctl status acestream`

View log `sudo journalctl -u acestream`


Готовые варианты
----------------

1. На ppa нашел репозиторий со старой версией (3.0.5.1-0ubuntu3)

https://launchpad.net/~phoenix1987/+archive/ubuntu/ppa

```bash
sudo add-apt-repository ppa:phoenix1987/ppa
sudo apt-get update
sudo apt-get install acestream-engine 
```

2. Так же есть snap пакет, но содержит еще плеер

http://forum.torrentstream.org/index.php?PHPSESSID=bo5jv89svl843sgtqi1530bj72&topic=12094.0

Запаковал Ace Stream (Engine + Player) в самодостаточный пакет snap. Кратко говоря, пакет snap несёт в себе программу и нужное ей, работая в профиле системы мандатного доступа AppArmor. Содержимое пакета сжато Squashfs и не распаковывается в систему по аналогии с deb. Софт в snap не зависит от наличия каких-либо библиотек в системе и их версий, что позволяет реализовать "сделал раз - работает везде".

Пока работа не обкатана на 100%, поэтому пакет программы доступен только на канале beta в Ubuntu Store и ставить программу нужно так

```
sudo snap install --beta acestreamplayer
```

Нужна помощь сообщества в тестировании движка, как самостоятельной сущности. В Терминале запускайте

```
acestreamplayer.engine --client-console
```

3. Лучшая реализация, но arch

https://aur.archlinux.org/packages/acestream-engine/

https://manjaro.ru/blog/newby-corner/ace-stream-i686.html