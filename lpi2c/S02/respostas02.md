---
template: index
title: Laboratório 02
sitename: LPIC-II - Laboratório 02
---

* [X] Configurar `VirtualHost` **www** para responder também pelo host associado ao IP (luke ou darthvader)

```apache
<VirtualHost *:80>
    ServerName www.theforce.corp
    ServerAlias luke.theforce.corp luke theforce.corp
    ServerAdmin webmaster@theforce.corp
    DocumentRoot /var/www/prod
</VirtualHost>
```

```apache
<VirtualHost *:80>
    ServerName www.darkside.corp
    ServerAlias darthvader.darkside.corp darthvader darkside.corp
    ServerAdmin webmaster@darkside.corp
    DocumentRoot /var/www/prod
</VirtualHost>
```

* [X] Configurar autenticação básica para o host **dev**

```bash
htpasswd -B -c /var/www/.htpasswd frederico
htpasswd -B /var/www/.htpasswd dev1
```

```apache
<VirtualHost *:80>
    ServerName dev.theforce.corp
    ServerAdmin webmaster@theforce.corp
    DocumentRoot /var/www/dev

    <Location />
        Deny from all
        AuthUserFile /var/www/.htpasswd
        AuthName "Area Restrita"
        AuthType Basic
        Satisfy Any
        require valid-user
    </Location>

</VirtualHost>
```

```bash
# Ubuntu
systemctl restart apache2

# CentOS
systemctl restart httpd
```
