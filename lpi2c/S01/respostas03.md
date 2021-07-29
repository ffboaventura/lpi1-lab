---
template: index
title: Laboratório 01
sitename: LPIC-II - Laboratório 01
---

## Roteadores

* [X] Configuração do serviço de DNS (bind)
* [X] Forwarder
* [X] Autoritativo
* [X] Master/Slave
* [X] Configuração da transferência de zonas entre os dois DNSs

### named.conf
* CentOS: [/etc/named.conf](rtr-ctos/named.conf)
* Ubuntu: [/etc/bind/named.conf](rtr-ubnt/named.conf)

### arquivos de zona

* CentOS: /var/named
* Ubuntu: /var/cache/bind

* Domínio 1: [theforce.corp.db](rtr-ubnt/theforce.corp.db)

```dns
$TTL 3D
@                  IN  SOA ns1.theforce.corp. nsadmin.theforce.corp. (
            2019101801  ; Serial
            28800       ; refresh (8h)
            7200        ; retry (2h)
            2592000     ; expire (30d)
            86400       ; minimum (1d)
    )
                   IN NS      c3po
                   IN MX  5   luke
luke               IN A       172.17.15.2
c3po               IN A       172.17.15.1
r2d2               IN CNAME   c3po
```

* Domínio 2: [darkside.corp.db](rtr-ctos/darkside.corp.db)

```dns
$TTL 3D
@   IN  SOA ns1.darkside.corp. nsadmin.darkside.corp. (
            2019101801  ; Serial
            28800       ; refresh (8h)
            7200        ; retry (2h)
            2592000     ; expire (30d)
            86400       ; minimum (1d)
    )
        NS      stormtrooper
        MX  5   darthvader
darthvader      A       172.18.2.2
stormtrooper    A       172.18.2.1
emperor         CNAME   darthvader
```

* Reverso 1: [172.17.15.rev.db](rtr-ubnt/172.17.15.rev.db)

```dns
$TTL 3D
@   IN  SOA ns1.theforce.corp. nsadmin.theforce.corp. (
            2019101801  ; Serial
            28800       ; refresh (8h)
            7200        ; retry (2h)
            2592000     ; expire (30d)
            86400       ; minimum (1d)
    )
        NS      c3po.theforce.corp.
1       PTR     c3po.theforce.corp.
2       PTR     luke.theforce.corp.
```

* Reverso 3: [172.18.2.rev.db](rtr-ctos/172.18.2.rev.db)

```dns
$TTL 3D
@   IN  SOA ns1.darkside.corp. nsadmin.darkside.corp. (
            2019101801  ; Serial
            28800       ; refresh (8h)
            7200        ; retry (2h)
            2592000     ; expire (30d)
            86400       ; minimum (1d)
    )
        NS      stormtrooper.darkside.corp.
1       PTR     stormtrooper.darkside.corp.
2       PTR     darthvader.darkside.corp.
```

### Atualização `root.hints`

* CentOS: `wget -O /var/named/root.hints ftp://ftp.internic.net/domain/named.cache`
* Ubuntu: `wget -O /var/cache/named/root.hints ftp://ftp.internic.net/domain/named.cache`

## Clientes

* [X] Configurar para utilizar o roteador como servidor de DNS primário

1. Alterar os nameservers nos arquivos de configuração de rede (netplan e network-scripts)
2. Alterar o arquivo `/etc/resolv.conf`

```
nameserver 10.9.8.X
domain <dominio>.corp
search <dominio>.corp
```

* [X] Testar acesso e funcionamento dos servidores de DNS

```
ping <nome_do_host>
host <nome_do_host>
host <endereco_ip>
```

* [X] Fazer consultas avançadas aos servidores de DNS

```
dig @10.9.8.X <ns|mx|cname|a> <dominio>.corp
```
