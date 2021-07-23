---
template: index
title: Laboratório 01
sitename: LPIC-II - Laboratório 01
---

## Roteadores

* [X] Estabelecer conexão entre as duas redes
  
### CentOS

```(bash)
systemctl stop firewalld
systemctl disable firewalld
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
```

Adicionando rotas estáticas para a rede **intra** oposta:
```bash
vi /etc/sysconfig/network-scripts/route-<ifname>
```

```bash
# /etc/sysconfig/network-scripts/route-<ifname>
YY.YY.YY.0/30 via 10.9.8.X
```

### Ubuntu

```(bash)
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
vi /etc/netplan/lab.yaml
```

```YAML
network:
  version: 2
  renderer: networkd
  ethernets:
    <ifname>:
      dhcp4: yes
    <ifname>:
      dhcp4: no
      dhcp6: no
      addresses: [10.9.8.XX/30, ]
      # gateway4:  10.9.8.X <-- Pode ser comentado
      routes:
        - to: YY.YY.YY.0/30
          via: 10.9.8.X
          metric: 100
 ```

* [X] Testar conexões entre os roteadores

```(bash)
ping -c 2 10.9.8.X
```

* [X] Testar conexões dos roteadores para os clientes da rede oposta

```(bash)
ping -c 2 172.X.X.X
```

* [X] Inspecionar pacotes trafegando pelos roteadores

```(bash)
tcpdump -i <ifname|any>
```

## Clientes

* [X] Testar conectividade com as máquinas da rede oposta

```(bash)
ping -c 2 10.9.8.X
ping -c 2 172.X.X.X
```

* [X] Identificar os serviços que estão rodando no roteador e no cliente da rede oposta

```(bash)
nmap -A 10.9.8.X 172.X.X.X
```

* [X] Inspecionar os pacotes que estão chegando na máquina

```(bash)
tcpdump -i <ifname|any>
```

* [X] Acessar os serviços da máquina cliente da rede oposta

```(bash)
nc 172.X.X.X <porta>
echo -e "GET /index.html HTTP/1.1\n\n" | nc 172.X.X.X 80
```
