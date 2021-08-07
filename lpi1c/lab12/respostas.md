---
template: index
title: Lab-12 - Configurando a rede
sitename: LPIC-I - Laboratório 01
---

[Lista de Comandos](../comandos.md)

## Requisitos

- N/A

<!--
 Desabilitar o `systemd-resolved`:

    ```bash
    sudo systemctl disable systemd-resolved
    sudo systemctl stop systemd-resolved
    sudo rm -f /etc/resolv.conf
    ```

    Editar o arquivo `/etc/NetworkManager/NetworkManager.conf` e logo abaixo do `[main]` acrescentar a linha:

    ```
    [main]
    dns=default
    ```
    -->

## Objetivos

1. Listar as conexões existentes no servidor

```bash
sudo nmcli conn show
```

1. Identificar o endereço IP atual na máquina

```bash
ip addr ls
```

```bash
sudo nmcli conn show id enp0s3
```

1. Identificar o gateway padrão atual na máquina

```bash
ip route ls
```

```bash
ip r
```

1. Identificar a interface de rede atual

```bash
ip addr ls
```

```bash
ip link ls
```

```bash
nmcli conn show
```

1. Alterar a configuração de rede do servidor:
    1. Adicionando o IP atual como estático
    1. Adicionando o gateway padrão atual como estático
    1. Adicionando os servidores DNS do Google (`8.8.8.8` e `8.8.4.4`)

      CentOS:

      ```bash
      sudo nmcli conn modify enp0s3 ip4 X.X.X.X
      sudo nmcli conn modify enp0s3 gw4 X.X.X.Y
      sudo nmcli conn modify enp0s3 ipv4.dns "8.8.8.8 8.8.4.4"
      sudo nmcli conn modify enp0s3 ipv4.method static
      sudo nmcli conn modify enp0s3 connection.autoconnect yes
      ```

      Ubuntu:

```bash
sudo cat > /etc/netplan/99-local.yml <<_EOF_
network:
  ethernets:
    enp0s3:
      dhcp4: false
      addresses: ["192.168.18.201/24"]
      gateway4: 192.168.18.1
      nameservers:
        addresses: ["8.8.8.8", "8.8.4.4"]
        search: [lpilab.local]
  version: 2
  _EOF_
  sudo netplan try
  sudo netplan apply
  ```

1. Reinicie a máquina e teste se a conexão de rede funciona


------------
[Respostas](respostas.md)
