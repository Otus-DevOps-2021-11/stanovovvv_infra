HW4 Deploying Test app
testapp_IP = 178.154.240.52
testapp_port = 9292
###
В YC с помощью консольной утилиты yc развернута машина reddit-app.
Для установки Ruby и MongoDB используются скрипты install_ruby.sh и install_mongodb.sh, они должны запускаться с правами суперпользователя, например с помощью sudo.
После установки Ruby и MongoDB выполняется деплой приложения скриптом deploy.sh.

Для автоматического развертывания и деплоя создан файл метадаты metadata.yaml, который передается в качестве параметра в строку CLI:
yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--platform standard-v3 \
--cores 2 \
--core-fraction 20 \
--memory=2 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=5GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata-from-file user-data=metadata.yaml

###
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
