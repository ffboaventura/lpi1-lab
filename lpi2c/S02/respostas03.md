---
template: index
title: Laboratório 02
sitename: LPIC-II - Laboratório 02
---

## Roteadores

* [X] Instalar e configurar easy-rsa nos roteadores

### CentOS:
```bash
yum install -y epel-release
yum install -y openssl easy-rsa

cp -Rv /usr/share/easy-rsa/3.0.6 /etc/CA
cd /etc/CA
vi vars
```

```bash
# /etc/CA/vars
set_var EASYRSA                 "$PWD"
set_var EASYRSA_PKI             "$EASYRSA/pki"
set_var EASYRSA_DN              "cn_only"
set_var EASYRSA_REQ_COUNTRY     "BR"
set_var EASYRSA_REQ_PROVINCE    "ES"
set_var EASYRSA_REQ_CITY        "Vitoria"
set_var EASYRSA_REQ_ORG         "Empire SA"
set_var EASYRSA_REQ_EMAIL       "sithlords@darkside.local"
set_var EASYRSA_REQ_OU          "Death Star"
set_var EASYRSA_KEY_SIZE        2048
set_var EASYRSA_ALGO            rsa
set_var EASYRSA_CA_EXPIRE       7500
set_var EASYRSA_CERT_EXPIRE     365
set_var EASYRSA_NS_SUPPORT      "no"
set_var EASYRSA_NS_COMMENT      "Empire CA"
set_var EASYRSA_EXT_DIR         "$EASYRSA/x509-types"
set_var EASYRSA_SSL_CONF        "$EASYRSA/openssl-easyrsa.cnf"
set_var EASYRSA_DIGEST          "sha256"
```

```bash
./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa gen-dh
```


### Ubuntu:
```bash
apt install -y openssl easy-rsa

cp -Rv /usr/share/easy-rsa /etc/CA

cd /etc/CA
vi vars
```

```bash
# Acrescentar no final do arquivo
export KEY_COUNTRY="BR"
export KEY_PROVINCE="ES"
export KEY_CITY="Vitoria"
export KEY_ORG="Jedi-Academy"
export KEY_EMAIL="council@theforce.local"
export KEY_OU="PadawanTrainingCenter"
export KEY_NAME="JediCA"
```

```bash
ln -s openssl-1.0.0.cnf openssl.cnf
source vars
./clean-all
./build-ca
./build-dh
```

* [X] Assinar os `CSR`s dos servidores Web e gerar os certificados

### CentOS

```bash
cd /etc/CA
./easyrsa sign-req server <dominio>

# Para Ubuntu:
scp /etc/CA/pki/issued/<dominio>.crt root@<cliente>:/etc/apache2/certs/
scp /etc/CA/pki/ca.crt root@<cliente>:/etc/apache2/certs/

# Para CentOS:
scp /etc/CA/pki/issued/<dominio>.crt root@<cliente>:/etc/httpd/certs/
scp /etc/CA/pki/ca.crt root@<cliente>:/etc/httpd/certs/
```

### Ubuntu

```bash
cd /etc/CA
source vars
./sign-req <dominio>

# Para Ubuntu:
scp /etc/CA/keys/<dominio>.crt root@<cliente>:/etc/apache2/certs/
scp /etc/CA/keys/ca.crt root@<cliente>:/etc/apache2/certs/

# Para CentOS:
scp /etc/CA/keys/<dominio>.crt root@<cliente>:/etc/httpd/certs/
scp /etc/CA/keys/ca.crt root@<cliente>:/etc/httpd/certs/
```

## Clientes

* [X] Gerar `CSR` para os domínios dos `VirtualHosts` **www**

```bash
# Ubuntu
mkdir /etc/apache2/certs
cd /etc/apache2/certs

# CentOS
mkdir /etc/httpd/certs
cd /etc/httpd/certs

openssl req -out <domain>.csr -new -newkey rsa:2048 -nodes -keyout <domain>.key

* Common Name (CN) == *.<domain> ou www.<domain>
```

```bash
# Para CentOS
scp <domain>.csr root@rtr-ctos:/etc/CA/pki/reqs/<domain>.req

# Para Ubuntu
scp <domain>.csr root@rtr-ubnt:/etc/CA/keys/
```

* [X] Configurar os `VirtualHosts` *www* para responder por `HTTPS`

### CentOS

```bash
yum install -y mod_ssl
vi /etc/httpd/conf.d/z-001-www-ssl.conf
```

[z-001-www-ssl](ctos/z-001-www-ssl.conf)
```apache
<VirtualHost *:443>
    ServerName www.darkside.local
    ServerAdmin webmaster@darkside.local
    DocumentRoot /var/www/prod
    
    SSLEngine On
    SSLCertificateFile /etc/httpd/certs/theforce.local.crt
    SSLCertificateKeyFile /etc/httpd/certs/theforce.local.key
    SSLCACertificateFile /etc/httpd/certs/ca.crt
</VirtualHost>
```

```bash
apachectl configtest
systemctl restart httpd
```

### Ubuntu

```bash
a2enmod ssl
vi /etc/apache2/sites-available/001-www-ssl.conf
```

[001-www-ssl](ubnt/001-www-ssl.conf)
```apache
<VirtualHost *:443>
    ServerName www.theforce.local
    ServerAdmin webmaster@theforce.local
    DocumentRoot /var/www/prod
    
    SSLEngine On
    SSLCertificateFile /etc/apache2/certs/theforce.local.crt
    SSLCertificateKeyFile /etc/apache2/certs/theforce.local.key
    SSLCACertificateFile /etc/apache2/certs/ca.crt
</VirtualHost>
```

```bash
a2ensite 001-www-ssl
apache2ctl configtest
systemctl restart apache2
```