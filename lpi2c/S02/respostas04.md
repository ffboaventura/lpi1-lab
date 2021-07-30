---
template: index
title: Laboratório 02
sitename: LPIC-II - Laboratório 02
---

## Roteadores

* [X] Instalar NGINX nos roteadores

```bash
# CentOS
yum install -y nginx

# Ubuntu
apt install -y nginx
```

* [X] Configurar site padrão no NGINX



* [X] Configurar proxy reverso no NGINX, apontando para os Apaches nos clientes

```bash
# CentOS
/etc/nginx/conf.d/z-001-proxy01.conf

# Ubuntu
/etc/nginx/sites-enabled/z-001-proxy01.conf
```

```nginx
##############################################
# VirtualHost para Proxy Reverso
##############################################
server {
    listen  80;
    server_name www.theforce.corp theforce.corp;
    
    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Host $host;

        proxy_pass http://luke.theforce.corp;
    }
}
```


## Clientes
