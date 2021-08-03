---
template: index
title: Laboratório 01
sitename: LPIC-II - Laboratório 01
---

## Instalar e configurar pacotes dos servidores

### CentOS

```bash
yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel
```

```bash
systemctl start slapd
systemctl enable slapd
```

* Gerar uma senha para ser utilizada pelo administrador

```bash
slappasswd -h '{SSHA}' -s '<senha>'
```

* Criar um arquivo `db.ldif` para fazer a configuração do servidor

```ldif
dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=darkside,dc=corp

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=admin,dc=darkside,dc=corp

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootPW
olcRootPW: <senha_gerada_anteriormente>
```

* Aplicar as modificações

```bash
ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif
```

* Configurar o banco de dados do LDAP

```bash
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap:ldap /var/lib/ldap/*

ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif
```

* Criar o arquivo de configuração da base `base.ldif`

```ldif
objectClass: organizationalRole
cn: admin
description: LDAP Manager

dn: ou=DeathStar,dc=darkside,dc=corp
objectClass: organizationalUnit
ou: DeathStar

dn: ou=BattleStation,ou=DeathStar,dc=darkside,dc=corp
objectClass: organizationalUnit
ou: BattleStation

dn: ou=Docking,dc=darkside,dc=corp
objectClass: organizationalUnit
ou: Docking
```

* Aplicar as alterações

```bash
ldapadd -x -W -D "cn=admin,dc=darkside,dc=corp" -f base.ldif
```

* Criar um novo usuário `anakin.ldif`

```ldif
dn: uid=anakin,ou=DeathStar,dc=darkside,dc=corp
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: anakin
uid: anakin
uidNumber: 9999
gidNumber: 100
homeDirectory: /home/anakin
loginShell: /bin/bash
gecos: Anakin Skywalker
userPassword: {crypt}x
shadowLastChange: 17058
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
```

```bash
# Aplicar as configurações
ldapadd -x -W -D "cn=admin,dc=darkside,dc=corp" -f anakin.ldif
```

```bash
# Adicionar uma senha para o usuário
ldappasswd -s <senha_para_usuário> -W -D "cn=admin,dc=darkside,dc=corp" -x "uid=anakin,ou=DeathStar,dc=darkside,dc=corp"
```

```bash
# Verificar as entradas no LDAP
ldapsearch -x cn=anakin -b dc=darkside,dc=corp
```

### Ubuntu

```bash
apt install -y slapd ldap-utils
```

```bash
sudo dpkg-reconfigure slapd

Omit OpenLDAP server configuration? No
DNS domain name: theforce.corp
Organization name: jediacademy
Administrator password: <senha>
Confirm password: <senha>
Do you want the database to be removed when slapd is purged? No
Move old database? Yes


```



## Configuração dos roteadores

* [X] Adicionar registros nos servidores LDAP locais

```bash
ldapadd -h 127.0.0.1 -x -W -D 'cn=admin,dc=<dominio>,dc=corp' -f /root/files/<dominio>.ldif
```

* [X] Identificar OUs existentes

```bash
ldapsearch -h 127.0.0.1 -x -W -D 'cn=admin,dc=<domino>,dc=corp' -b 'dc=<dominio>,dc=<corp>' '(objectClass=organizationalUnit)'
```

* [X] Listar usuários do Marketing

```bash
ldapsearch -v -h 127.0.0.1 -x -w 123456 -D 'cn=admin,dc=theforce,dc=corp' -b 'dc=<dominio>,dc=<corp>' '(&(ou=Marketing) (objectClass=inetOrgPerson))'
```

* [X] Criar usuário para autenticação no servidor Web

```bash
vi /root/files/dev.ldif
```

```ldif
# dev.ldif
dn: cn=Desenvolvedor Anonimo,ou=Engenharia,dc=theforce,dc=corp
objectClass: inetOrgPerson
cn: Desenvolvedor Anonimo
sn: Anonimo
uid: dev
userPassword: password
homePhone: +1-829-144-9642x191
mail: dev@theforce.corp
description: Adaptive interactive focus group
ou: Engenharia

```

```bash
ldapadd -h 127.0.0.1 -x -W -D 'cn=admin,dc=<dominio>,dc=corp' -f /root/files/dev.ldif
```

## Configuração dos clientes

* [X] Configurar Apache para autenticar no LDAP

### Ubuntu

```bash
a2enmod authnz_ldap
vi /etc/apache2/sites-available/002-dev.conf
```

[002-dev.conf](ubnt/002-dev.conf)
```apache
<VirtualHost *:80>
    ServerName dev.<dominio>.corp
    ServerAdmin webmaster@<dominio>.corp
    DocumentRoot /var/www/dev

    <Location />
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All

        Order allow,deny
        Allow from all
        AuthName "Area Restrita"
        AuthType Basic
        AuthBasicProvider ldap
        #AuthzLDAPAuthoritative on

        # Search user
        AuthLDAPURL ldap://172.18.2.1:389/ou=Engenharia,dc=<dominio>,dc=corp?uid?sub

        # Use this user to bind to LDAP
        AuthLDAPBindDN cn=admin,dc=<dominio>,dc=corp
        AuthLDAPBindPassword 123456
        Require valid-user

        # More restrictions!
        # specific user
        #   Require ldap-user john.doe john1.doe john2.doe
        # specific user by DN
        #   Require ldap-dn CN=John Doe,OU=Finance,OU=Germany,DC=example,DC=net
        # member of group
        #   Require ldap-group CN=Finance Department,OU=Finance,OU=Germany,DC=example,DC=net
    </Location>

</VirtualHost>
```

```bash
systemctl reload apache2
```

### CentOS

```bash
yum install -y mod_ldap
vi /etc/httpd/conf.d/z-002-dev.conf
```

```apache
<VirtualHost *:80>
    ServerName dev.<dominio>.corp
    ServerAdmin webmaster@<dominio>.corp
    DocumentRoot /var/www/dev

    <Location />
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All

        Order allow,deny
        Allow from all
        AuthName "Area Restrita"
        AuthType Basic
        AuthBasicProvider ldap
        #AuthzLDAPAuthoritative on

        # Search user
        AuthLDAPURL ldap://172.18.2.1:389/ou=Engenharia,dc=<dominio>,dc=corp?uid?sub

        # Use this user to bind to LDAP
        AuthLDAPBindDN cn=admin,dc=<dominio>,dc=corp
        AuthLDAPBindPassword 123456
        Require valid-user

    </Location>

</VirtualHost>
```

```bash
systemctl reload httpd
```
