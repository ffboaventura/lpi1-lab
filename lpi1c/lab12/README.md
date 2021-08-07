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
1. Identificar o endereço IP atual na máquina
1. Identificar o gateway padrão atual na máquina
1. Identificar a interface de rede atual
1. Alterar a configuração de rede do servidor:
    1. Adicionando o IP atual como estático
    1. Adicionando o gateway padrão atual como estático
    1. Adicionando os servidores DNS do Google (`8.8.8.8` e `8.8.4.4`)
1. Reinicie a máquina e teste se a conexão de rede funciona

------------
[Respostas](respostas.md)
