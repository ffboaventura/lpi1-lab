---
template: index
title: Laboratório 02
sitename: LPIC-II - Laboratório 02
---

## Topologia

![Lab 01](/lpi2c/images/lpi2_lab_s02.png)

## Pacotes Necessários

### CentOS

#### Clientes

```(bash)
yum install -y nmap traceroute tcpdump nmap-ncat bind-utils net-tools httpd openssh-server postfix
```

#### Roteadores

```(bash)
yum install -y nmap traceroute tcpdump nmap-ncat net-tools bind openssh-server

sudo iptables -t nat -I POSTROUTING -o enp0s3 -j MASQUERADE
```

### Ubuntu

#### Clientes

```(bash)
apt install -y nmap traceroute tcpdump netcat dnsutils apache2 openssh-server postfix
```

#### Roteadores

```(bash)
apt install -y nmap traceroute tcpdump netcat bind9 dnsutils apache2

sudo iptables -t nat -I POSTROUTING -o enp0s3 -j MASQUERADE
```

## Redes

| Rede   | Endereçamento | Máquinas |
|--------|---------------|----------|
| intra1 | 172.18.2.0/30 | &lt;nome&gt;-ctos |
|        |               | rtr-01 |
| intra2 | 172.17.15.0/30 | &lt;nome&gt;-ubnt |
|        |                | rtr-02 |
| inter0 | 10.9.8.0/30    | rtr-01 |
|        |                | rtr-02 |
| NAT    | DHCP           | rtr-01 |
|        |                | rtr-02 |

## Configurações

### &lt;nome&gt;-ctos

* Interface de Rede:
  * IP: 172.18.2.2/30
  * MASK: 255.255.255.252

### &lt;nome&gt;-ubnt

* Interface de Rede:
  * IP: 172.17.15.2/30
  * MASK: 255.255.255.252

### rtr-01

* Interface de Rede Intra:
  * IP: 172.18.2.1/30
  * MASK: 255.255.255.252

* Interface de Rede Inter:
  * IP: 10.9.8.1/30
  * MASK: 255.255.255.252

* Interface de Rede Externa:
  * IP: DHCP

### rtr-02

* Interface de Rede Intra:
  * IP: 172.17.15.1/30
  * MASK: 255.255.255.252

* Interface de Rede Inter:
  * IP: 10.9.8.2/30
  * MASK: 255.255.255.252

* Interface de Rede Externa:
  * IP: DHCP

## Objetivos

* [Objetivos 01](objetivos01.md)
* [Objetivos 02](objetivos02.md)
* [Objetivos 03](objetivos03.md)
* [Objetivos 04](objetivos04.md)
