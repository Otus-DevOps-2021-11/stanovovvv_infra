bastion_IP = 130.193.49.156
someinternalhost_IP = 10.128.0.8
someinternalhost_Hostname = internal-lan
Username_ssh = vasvs
Pritunl_servername = bastion_test
Pritunl_orgname = test_org
Bastion_OS = Ubuntu-20.04

###
В облаке Yandex Cloud развернуты две машины: Bastion - с внешним IP и internal-lan без доступа к внешним сетям.
Обе машины находятся в одной внутренней сети облака - 10.128.0.0/24.
Подключение к серверам осуществляется по ssh ключу. На сервере Bastion настроен VPN сервер Pritunl для безопасного доступа к внутренней сети облака.

1. Для подключения к внутреннему серверу одной командой можно использовать Bastion host в качестве Jump сервера для ssh подключения, ключ J:
ssh -J vasvs@130.193.49.156 10.128.0.8

2. Для подключения по алиасу можно записать Hostname удаленной машины в /etc/hosts:
10.128.0.8	internal-lan
После чего добавить в конфиг ssh параметры Jump сервера для подключения:
Host internal-lan
    ProxyJump vasvs@130.193.49.156
В результате подключение будет по алиасу:
ssh internal-lan

3.Для сервера Pritunl получен сертификат Let’s Encrypt для DNS имени 130.193.49.156.sslip.io.
###
