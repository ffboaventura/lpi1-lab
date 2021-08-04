---
template: index
title: Laboratório 05
sitename: LPIC-II - Laboratório 05
---

## Configuração dos roteadores


## Configuração dos clientes

* [X] Instalar o Postfix

```shell
# CentOS
$ yum install -y postfix mailx

# Ubuntu
$ apt install -y postfix s-nail
```

* [X] Configurar o Postfix para receber e-mails para o domínio

```shell
$ echo `hostname` > /etc/mailname
$ cd /etc/postfix
$ vi main.cf
```

[main.cf](confs/main.cf)

```ini
# main.cf
smtpd_banner = $myhostname ESMTP $mail_name
biff = no
append_dot_mydomain = no
readme_directory = no
compatibility_level = 2
smtpd_tls_cert_file=/etc/(httpd|apache2)/certs/<dominio>.crt
smtpd_tls_key_file=/etc/(httpd|apache2)/certs/<dominio>.key
smtpd_use_tls=yes
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache
smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination
myhostname = <hostname>
mydomain = <dominio>
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = $mydomain
mydestination = $myhostname, $mydomain, localhost.<dominio>, localhost
relayhost =
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 172.17.15.0/24 172.18.2.0/24 10.9.8.0/30
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
default_transport = smtp
relay_transport = smtp
inet_protocols = ipv4
```

```shell
$ postfix reload
```

* [X] Criar usuários para receber e-mails

```shell
$ useradd -c "Nome do Usuario" -d /home/<login> -s /bin/bash -m <login>
$ useradd -c "Nome do Usuario" -d /home/<login> -s /bin/bash -m <login>
$ passwd <login>
$ su - <login>
```

* [X] Enviar e-mail de um domínio para o outro

```shell
# CentOS
$ echo "Roses are red, violets are blue..." | mailx -s "Roses?" -v <login>@<dominio>

# Ubuntu
$ echo "Roses are red, violets are blue..." | s-nail -s "Roses?" -v <login>@<dominio>
```

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# mail_test.py

import smtplib
from email.mime.text import MIMEText

msg_content = '<h2>Luke, I am your father!</h2>\n'
message = MIMEText(msg_content, 'html')

message['From'] = 'Darth Vader <dvader@darkside.corp>'
message['To'] = 'Luke Skywalker <luke@theforce.corp>'
message['Subject'] = 'Big Surprise!'

msg_full = message.as_string()

server = smtplib.SMTP('darthvader.darkside.corp:25')
# server.starttls()
# server.login('user', 'pass')
server.sendmail(message['From'], message['To'], msg_full)

server.quit()
```

* [X] Verificar se os e-mails foram entregues

```shell
$ su - <login>
$ mailx

OU

$ cat /var/spool/mail/<login>
```

[Objetivos](objetivos01.md)
