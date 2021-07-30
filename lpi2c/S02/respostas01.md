---
template: index
title: Laboratório 02
sitename: LPIC-II - Laboratório 02
---

## Configuração dos roteadores

* [X] Fazer inspeção dos pacotes e garantiar conectividade entre os servidores
* [X] Configurar DNS para acrescentar nomes dos hosts

### Ubuntu

```bash
vi /var/cache/bind/theforce.corp.db
```

```dns
$TTL 3D
@   IN  SOA ns1.theforce.corp. nsadmin.theforce.corp. (
            2019102301  ; Serial            <========= Alterar o Serial
[...]
www     A   172.17.15.2 ;                   <========= Acrescentar entrada para www (A ou CNAME)
dev     CNAME www       ;                   <========= Acrescentar entrada para dev (A ou CNAME)

```

```bash
rndc reload
```

### CentOS

```bash
vi /var/named/darkside.corp.db
```

```dns
$TTL 3D
@   IN  SOA ns1.darkside.corp. nsadmin.darkside.corp. (
            2019102301  ; Serial            <========= Alterar o Serial
[...]
www     A   172.18.2.2  ;                   <========= Acrescentar entrada para www (A ou CNAME)
dev     CNAME www       ;                   <========= Acrescentar entrada para dev (A ou CNAME)

```

```bash
rndc reload
```

## Configuração dos clientes

* [X] Configuração básica do Apache
  * [X] Testar acesso de um cliente para o outro (wget ou curl) através do IP

  ```bash
  wget -O - 172.18.2.2
  wget -O - 172.17.15.2
  curl 172.18.2.2
  curl 172.17.15.2
  ```

  * [X] Testar acesso de um cliente para o outro (wget ou curl) através do hostname

  ```bash
  wget -O - luke.theforce.corp
  wget -O - darthvader.darkside.corp
  curl luke.theforce.corp
  curl darthvader.darkside.corp
  ```

* [X] Configurar Hosts Virtuais
   * [X] Configurar um `VirtualHost` para servir o site `www.dominio.corp`
   * [X] Configurar um `VirtualHost` para servir o site `dev.dominio.corp`
   * [X] Utilizar o modelo de site para os dois `VirtualHost` a partir de diretórios diferentes

### Ubuntu:

```bash
cd /etc/apache2/sites-available
vi 001-www.conf
```

[001-www.conf](ubnt/001-www.conf)
```apache
<VirtualHost *:80>
    ServerName www.darkside.corp
    ServerAdmin webmaster@darkside.corp
    DocumentRoot /var/www/prod
</VirtualHost>
```

```bash
vi 002-dev.conf
```

[002-dev.conf](ubnt/002-dev.conf)
```apache
<VirtualHost *:80>
    ServerName dev.darkside.corp
    ServerAdmin webmaster@darkside.corp
    DocumentRoot /var/www/dev
</VirtualHost>
```

```bash
wget -O /var/www/site.tar.bz2 https://labs.fboaventura.dev/lpi2c/S02/site.tar.bz2
cd /var/www
tar jxvf site.tar.bz2
cp -Rv site prod
cp -Rv site dev
a2ensite 001-www
a2ensite 002-dev
a2enmod vhost_alias
systemctl restart apache2
```

### CentOS:

```bash
cd /etc/httpd/conf.d
vi z-001-www.conf
```

[z-001-www.conf](ctos/z-001-www.conf)
```apache
<VirtualHost *:80>
    ServerName www.theforce.corp
    ServerAdmin webmaster@theforce.corp
    DocumentRoot /var/www/prod
</VirtualHost>
```

```
vi z-002-dev.conf
```

[z-002-dev.conf](ctos/z-002-dev.conf)
```apache
<VirtualHost *:80>
    ServerName dev.theforce.corp
    ServerAdmin webmaster@theforce.corp
    DocumentRoot /var/www/dev
</VirtualHost>
```

```bash
cd /var/www
wget -O site.tar.gz https://labs.fboaventura.dev/lpi2c/S02/site.tar.gz
tar xzvf site.tar.gz
cp -Rv site prod
cp -Rv site dev
systemctl restart httpd
```

**Modelo de Site**: [site.tar.bz2](site.tar.bz2) | [site.tar.gz](site.tar.gz)
