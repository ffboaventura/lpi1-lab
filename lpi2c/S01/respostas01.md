---
template: index
title: Laboratório 01
sitename: LPIC-II - Laboratório 01
---

## Configuração dos roteadores

* [X] Instalar pacotes
  
```shell
$ yum install -y nmap traceroute tcpdump nmap-ncat net-tools bind openssh-server
$ apt install -y nmap traceroute tcpdump netcat bind9 dnsutils apache2
```

* [X] Alterar hostname

```shell
$ hostnamectl set-hostname <hostname>.<dominio>
```

* [X] Alterar configurações de rede

### Teste de conectividade para identificar interfaces

```shell
$ ip addr add XX.XX.XX.1/30 dev <ifname>
$ ip addr add YY.YY.YY.1/30 dev <ifname>
$ ping -c 2 XX.XX.XX.2
$ ping -c 2 YY.YY.YY.2
```

### CentOS

```shell
$ cd /etc/sysconfig/network-scripts
$ vi ifcfg-<ifname>;
```

```ini
# /etc/sysconfig/network-scripts/ifcfg-<ifname>
TYPE="Ethernet"
BOOTPROTO="static"
IPADDR="XX.XX.XX.XX"
NETMASK="255.255.255.252"
DEVICE="<ifname>"
ONBOOT="yes"
```

### Ubuntu

```shell
$ vi /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
```

```yaml
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
network: {config: disabled}
```

```shell
$ cd /etc/netplan
$ mv 50-cloud-init.yaml 50-cloud-init.off
$ vi /etc/netplan/lab.yaml
```

```yaml
# /etc/netplan/lab.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    <ifname>:
      dhcp4: yes
    <ifname>:
      dhcp4: no
      dhcp6: no
      addresses: [XX.XX.XX.XX/30]
      gateway4:  XX.XX.XX.XX
```

* [X] Garantir que os serviços do Bind e OpenSSH estejam funcionando

```shell
$ systemctl status bind9
$ systemctl status named
$ systemctl status sshd
$ systemctl enable bind9
$ systemctl enable named
$ systemctl enable sshd
```

```shell
$ for srv in bind9 named sshd; do
    systemctl status ${srv}
    systemctl enable ${srv}
done
```

## Configuração dos clientes

* [X] Instalar pacotes
* [X] Alterar hostname

```shell
$ hostnamectl set-hostname <hostname>.<dominio>
```

* [X] Alterar configurações de rede

### CentOS

```shell
$ cd /etc/sysconfig/network-scripts
$ vi ifcfg-<ifname>;
```

```ini
# /etc/sysconfig/network-scripts/ifcfg-<ifname>
TYPE="Ethernet"
BOOTPROTO="static"
IPADDR="XX.XX.XX.XX"
NETMASK="255.255.255.252"
DEVICE="<ifname>"
ONBOOT="yes"
```

### Ubuntu

```shell
$ vi /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
```

```(YAML)
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
network: {config: disabled}
```

```shell
$ cd /etc/netplan
$ mv 50-cloud-init.yaml 50-cloud-init.off
$ vi /etc/netplan/lab.yaml
```

```(YAML)
# /etc/netplan/lab.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    <ifname>:
      dhcp4: yes
    <ifname>:
      dhcp4: no
      dhcp6: no
      addresses: [XX.XX.XX.XX/30]
      gateway4:  XX.XX.XX.XX
```

* [X] Garantir que os serviços do Apache e OpenSSH estejam funcionando

```shell
$ systemctl status apache2
$ systemctl status httpd
$ systemctl status sshd
$ systemctl enable apache2
$ systemctl enable httpd
$ systemctl enable sshd
```

```shell
$ for srv in apache2 httpd sshd; do
    systemctl status ${srv}
    systemctl enable ${srv}
done
```
