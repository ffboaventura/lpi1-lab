---
template: index
title: Laboratório 01
sitename: LPIC-II - Laboratório 01
---

## Configuração dos roteadores

* [X] Adicionar registros nos servidores LDAP locais

```bash
ldapadd -h 127.0.0.1 -x -W -D 'cn=admin,dc=<dominio>,dc=local' -f /root/files/<dominio>.ldif 
```

* [X] Identificar OUs existentes

```bash
ldapsearch -h 127.0.0.1 -x -W -D 'cn=admin,dc=<domino>,dc=local' -b 'dc=<dominio>,dc=<local>' '(objectClass=organizationalUnit)'
```

* [X] Listar usuários do Marketing

```bash
ldapsearch -v -h 127.0.0.1 -x -w 123456 -D 'cn=admin,dc=theforce,dc=local' -b 'dc=<dominio>,dc=<local>' '(&(ou=Marketing) (objectClass=inetOrgPerson))'
```

* [X] Criar usuário para autenticação no servidor Web

```bash
vi /root/files/dev.ldif
```

```ldif
# dev.ldif
dn: cn=Desenvolvedor Anonimo,ou=Engenharia,dc=theforce,dc=local
objectClass: inetOrgPerson
cn: Desenvolvedor Anonimo
sn: Anonimo
uid: dev
userPassword: password
homePhone: +1-829-144-9642x191
mail: dev@theforce.local
description: Adaptive interactive focus group
ou: Engenharia

```

```bash
ldapadd -h 127.0.0.1 -x -W -D 'cn=admin,dc=<dominio>,dc=local' -f /root/files/dev.ldif
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
    ServerName dev.<dominio>.local
    ServerAdmin webmaster@<dominio>.local
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
        AuthLDAPURL ldap://172.18.2.1:389/ou=Engenharia,dc=<dominio>,dc=local?uid?sub

        # Use this user to bind to LDAP
        AuthLDAPBindDN cn=admin,dc=<dominio>,dc=local
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
    ServerName dev.<dominio>.local
    ServerAdmin webmaster@<dominio>.local
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
        AuthLDAPURL ldap://172.18.2.1:389/ou=Engenharia,dc=<dominio>,dc=local?uid?sub

        # Use this user to bind to LDAP
        AuthLDAPBindDN cn=admin,dc=<dominio>,dc=local
        AuthLDAPBindPassword 123456
        Require valid-user

    </Location>

</VirtualHost>
```

```bash
systemctl reload httpd
```