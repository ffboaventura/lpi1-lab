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
vi /var/cache/bind/theforce.local.db
```

```dns
$TTL 3D
@   IN  SOA ns1.theforce.local. nsadmin.theforce.local. (
            2019102301  ; Serial            <========= Alterar o Serial
[...]
www     A   172.17.15.2 ;                   <========= Acrescentar entrada para www (A ou CNAME)
dev     CNAME www       ;                   <========= Acrescentar entrada para dev (A ou CNAME)

saltmaster  A   172.31.7.54

```

```bash
rndc reload
```

### CentOS

```bash
vi /var/named/darkside.local.db
```

```dns
$TTL 3D
@   IN  SOA ns1.darkside.local. nsadmin.darkside.local. (
            2019102301  ; Serial            <========= Alterar o Serial
[...]
www     A   172.18.2.2  ;                   <========= Acrescentar entrada para www (A ou CNAME)
dev     CNAME www       ;                   <========= Acrescentar entrada para dev (A ou CNAME)

saltmaster  A   172.31.7.54
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
  wget -O - luke.theforce.local
  wget -O - darthvader.darkside.local
  curl luke.theforce.local
  curl darthvader.darkside.local
  ```

* [X] Configurar Hosts Virtuais
   * [X] Configurar um `VirtualHost` para servir o site `www.dominio.local`
   * [X] Configurar um `VirtualHost` para servir o site `dev.dominio.local`
   * [X] Utilizar o modelo de site para os dois `VirtualHost` a partir de diretórios diferentes 
 
### Ubuntu:

```bash
cd /etc/apache2/sites-available
vi 001-www.conf
```

[001-www.conf](ubnt/001-www.conf)
```apache
<VirtualHost *:80>
    ServerName www.theforce.local
    ServerAdmin webmaster@theforce.local
    DocumentRoot /var/www/prod
</VirtualHost>
```

```bash
vi 001-dev.conf
```

[002-dev.conf](ubnt/002-dev.conf)
```apache
<VirtualHost *:80>
    ServerName dev.theforce.local
    ServerAdmin webmaster@theforce.local
    DocumentRoot /var/www/dev
</VirtualHost>
```

```bash
wget -O /var/www/site.tar.bz2 http://172.31.7.54/S02/site.tar.bz2
cd /var/www
tar jxvf site.tar.bz2
cp -Rv site prod
cp -Rv site dev
a2ensite 001-www
a2ensite 002-dev
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
    ServerName www.darkside.local
    ServerAdmin webmaster@darkside.local
    DocumentRoot /var/www/prod
</VirtualHost>
```

```
vi z-002-dev.conf
```

[z-002-dev.conf](ctos/z-002-dev.conf)
```apache
<VirtualHost *:80>
    ServerName dev.darkside.local
    ServerAdmin webmaster@darkside.local
    DocumentRoot /var/www/dev
</VirtualHost>
```

```bash
cd /var/www
wget -O site.tar.gz http://172.31.7.54/S02/site.tar.gz
tar xzvf site.tar.gz
cp -Rv site prod
cp -Rv site dev
systemctl restart httpd
```

**Modelo de Site**: [site.tar.bz2](site.tar.bz2) | [site.tar.gz](site.tar.gz)
  