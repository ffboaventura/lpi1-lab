---
template: index
title: Laboratório 04
sitename: LPIC-II - Laboratório 04
---

## Configuração dos roteadores

* [X] Instalar o Samba

```shell
# CentOS
$ yum install -y samba samba-client samba-winbind cifs-utils

# Ubuntu
$ apt install -y samba winbind smbclient cifs-utils
```

* [X] **rtr-01**: Configurar o Samba em modo _Standalone_

```shell
$ vi /etc/samba/smb.conf
```

```ini
[global]
        server string = Lab Server

[homes]
        comment = Homes Directories
        read only = No
        browseable = No

[printers]
        comment = All printers
        path = /var/spool/samba
        printable = Yes
        browseable = No
```

* [X] **rtr-01**: Criar e compartilhar um diretório através do Samba

```shell
$ mkdir -p /data/samba/{www,fserver}
$ vi /etc/samba/smb.conf
```

```ini
[www]
    comment = Arquivos para o site
    path = /data/samba/www
    read only = Yes
    browseable = Yes

[dados]
    comment = File Server
    path = /data/samba/fserver
    read only = No
    browseable = No
    valid users = dvader, luke
    create mask = 0660
    directory mask = 0770
```

* [X] **rtr-02**: Configurar o Samba em modo _PDC_

```shell
$ vi /etc/samba/smb.conf
```

```ini
[global]
        netbios name = rtr-02
        server string = Lab PDC Server
        workgroup = LAB01
        domain master = Yes
        preferred master = Yes
        domain logons = Yes
        os level = 100
        logon path = \\%N\%U\profile
        logon drive = H:
        logon home = \\%N\%U\profile
        logon path = logon.cmd
        idmap config * : backend        = tdb
        idmap config * : range          = 1000000-1999999

        idmap config LAB01 : backend     = rid
        idmap config LAB01 : range       = 5000000-5999999

        idmap config TRUSTED : backend  = rid
        idmap config TRUSTED : range    = 6000000-6999999


[netlogon]
        comment = Login
        path = /var/lib/samba/netlogon
        read only = Yes

[homes]
        comment = Homes Directories
        read only = No
        browseable = No

[printers]
        comment = All printers
        path = /var/spool/samba
        printable = Yes
        browseable = No
```

* [X] Adicionar usuários para autenticação

```shell
$ useradd -c "Darth Vader" -d /home/dvader -s /bin/bash -m dvader
$ passwd dvader
$ smbpasswd -a dvader

$ useradd -c "Luke Skywalker" -d /home/luke -s /bin/bash -m luke
$ passwd luke
$ smbpasswd -a luke

$ useradd -c "Cliente CentOS" -d /dev/null -s /bin/false frederico-ctos$
$ passwd -l frederico-ctos$
$ smbpasswd -m -a frederico-ctos

$ useradd -c "Cliente Ubuntu" -d /dev/null -s /bin/false frederico-ubnt$
$ passwd -l frederico-ubnt$
$ smbpasswd -m -a frederico-ubnt
```

## Configuração dos clientes

* [X] Instalar o Samba

```shell
# CentOS
$ yum install -y samba samba-client samba-winbind cifs-utils

# Ubuntu
$ apt install -y samba winbind smbclient cifs-utils
```

* [X] **cliente 01**: Configurar o Samba como membro do domínio do **rtr-02**

```shell
$ vi /etc/samba/smb.conf
```

```ini
[global]
        netbios name = frederico-ubnt
        server string = Lab Client
        workgroup = LAB01
        domain master = No
        preferred master = No
        domain logons = No
        os level = 0
        password server = rtr-02
        security = domain

[homes]
        comment = Homes Directories
        read only = No
        browseable = No
```

* [X] **cliente 01**: Listar os compartilhamentos disponíveis no **rtr-02**

```shell
$ smbclient -L //rtr-02 -U luke -W LAB01
```

* [X] **cliente 01**: Acessar um compartilhamento no **rtr-02** utilizando o `smbclient`

```shell
$ smbclient //rtr-02/www -U luke -W LAB01
```

* [X] **cliente 02**: Listar os compartilhamentos disponíveis no **rtr-01**

```shell
$ smbclient -L //rtr-01
```

* [X] **cliente 02**: Montar o diretório compartilhado no **rtr-01** utilizando o `mount`

```shell
$ mkdir -p /dados/smb/www
$ mount -t cifs //rtr01/www /dados/smb/www -o user=luke,password=123456
```

* [X] Configurar o compartilhamento para ser montado via `fstab`

```shell
$ mkdir -p /dados/smb/www
$ vi /etc/fstab
```

```bash
# /etc/fstab
\\rtr01\www /dados/smb/www    cifs    defaults,user=luke,password=123456  0   0
```

```shell
$ mount /dados/smb/www
```

## Respostas

[Respostas](respostas01.md)
