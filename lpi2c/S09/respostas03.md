---
template: index
title: Laboratório 09
sitename: LPIC-II - Laboratório 09
---

## Garantindo segurança dos acessos

### Roteadores

* [X] Criar um script de firewall que:
    * [X] Permita o acesso dos clientes à Internet
    * [X] Redirecione a porta `8889` externa para o servidor `http` dos clientes
    * [X] Redirecione a porta `8443` externa para o servidor `https` dos clientes
    * [X] Redirecione a porta `2222` externa para o servidor `ssh` dos clientes

### Roteador Azul

* [X] Permitir o acesso ao servidor `web` do cliente `azul` apenas a partir do roteador `vermelho`
* [X] Bloquear o acesso ao serviço `ssh` para o roteador `vermelho`

### Roteador Vermelho

* [X] Fazer com que o cliente `vermelho` consiga acessar o servidor `web` do cliente `azul`


#### Resolução Roteadores

* Criar o diretório `/etc/fw`
* Criar o arquivo `firewall.sh` com o conteúdo abaixo, alterando a variável `FW` para o lado correto da rede

```bash
#!/bin/bash

FW="azul" # azul ou vermelho

IPT=$(which iptables)

# Interfaces
IF_INT="enp0s8"
IF_EXT="enp0s3"
IF_RTR="enp0s9"

# IPs
IP_CLT_AZ="172.18.2.2"
IP_CLT_VM="172.17.15.2"
IP_RTR_AZ_RT="10.9.8.1"
IP_RTR_AZ_IN="172.18.2.1"
IP_RTR_AZ_EX="192.168.18.202" # IP da rede local onde está ligado o virtualbox
IP_RTR_VM_RT="10.9.8.2"
IP_RTR_VM_IN="172.17.15.1"
IP_RTR_VM_EX="192.168.18.199" # IP da rede local onde está ligado o virtualbox

# Serviços
SSH="22"

# Limpa
function stop {
  ${IPT} -w -P INPUT ACCEPT
  ${IPT} -w -P FORWARD ACCEPT
  ${IPT} -w -P OUTPUT ACCEPT
  ${IPT} -w -F INPUT
  ${IPT} -w -F OUTPUT
  ${IPT} -w -F FORWARD
  ${IPT} -w -t nat -F INPUT
  ${IPT} -w -t nat -F OUTPUT
  ${IPT} -w -t nat -F POSTROUTING
  ${IPT} -w -t nat -F PREROUTING
}

function start {
  if [[ "${FW}" == "azul" ]]; then
    # Permita o acesso dos clientes à Internet
    ${IPT} -w -t nat -A POSTROUTING -o ${IF_EXT} -s ${IP_CLT_AZ} -j MASQUERADE
    # Redirecione a porta 8889 externa para o servidor web dos clientes
    ${IPT} -w -t nat -A PREROUTING -i ${IF_EXT} -p tcp --dport 8889 -j DNAT --to ${IP_CLT_AZ}:80
    # Redirecione a porta 8443 externa para o servidor https dos clientes
    ${IPT} -w -t nat -A PREROUTING -i ${IF_EXT} -p tcp --dport 8443 -j DNAT --to ${IP_CLT_AZ}:443
    # Redirecione a porta 2222 externa para o servidor ssh dos clientes
    ${IPT} -w -t nat -A PREROUTING -i ${IF_EXT} -p tcp --dport 2222 -j DNAT --to ${IP_CLT_AZ}:${SSH}

    # Permitir o acesso ao servidor web do cliente azul apenas a partir do roteador vermelho
    ${IPT} -w -A FORWARD -i ${IF_RTR} -p tcp -m multiport --dports 80,443 ! -s ${IP_RTR_VM_RT} -d ${IP_CLT_AZ} -j REJECT

    # Bloquear o acesso ao serviço ssh para o roteador vermelho
    ${IPT} -w -A FORWARD -i ${IF_RTR} -p tcp --dport ${SSH} -s ${IP_RTR_VM_RT} -j REJECT

  elif [[ "${FW}" == "vermelho" ]]; then
    # Permita o acesso dos clientes à Internet
    ${IPT} -w -t nat -A POSTROUTING -o ${IF_EXT} -s ${IP_CLT_VM} -j MASQUERADE
    # Redirecione a porta 8889 externa para o servidor web dos clientes
    ${IPT} -w -t nat -A PREROUTING -i ${IF_EXT} -p tcp --dport 8889 -j DNAT --to ${IP_CLT_VM}:80
    # Redirecione a porta 8443 externa para o servidor https dos clientes
    ${IPT} -w -t nat -A PREROUTING -i ${IF_EXT} -p tcp --dport 8443 -j DNAT --to ${IP_CLT_VM}:443
    # Redirecione a porta 2222 externa para o servidor ssh dos clientes
    ${IPT} -w -t nat -A PREROUTING -i ${IF_EXT} -p tcp --dport 2222 -j DNAT --to ${IP_CLT_VM}:${SSH}

    # Fazer com que o cliente vermelho consiga acessar o servidor web do cliente azul
    ${IPT} -w -t nat -A POSTROUTING -i ${IF_RTR} -p tcp -m multiport --dports 80,443 -s ${IP_CLT_VM} -d ${IP_CLT_AZ} -j SNAT --to ${IP_RTR_VM_RT}
  fi
}

cmd=$1
test -z "$cmd" && {
  cmd="start"
}

case "$cmd" in
  start)
    stop
    start
    RETVAL=$?
    ;;

  stop)
    stop
    RETVAL=$?
    ;;

  reload)
    $0 stop
    $0 start
    RETVAL=$?
    ;;

  *)
    echo "Usage $0 [start|stop|reload]"
    ;;

esac

exit $RETVAL
```

### Cliente Azul

* [ ] Criar um script de firewall que:
    * [ ] Permita acesso ao servidor web apenas do roteador ou local
    * [ ] Permita acesso via SSH do roteador azul e do cliente vermelho

```bash
#!/bin/bash

IPT=$(which iptables)

# Interfaces
IF_INT="enp0s8"
IF_EXT="enp0s3"
IF_RTR="enp0s9"

# IPs
IP_CLT_AZ="172.18.2.2"
IP_CLT_VM="172.17.15.2"
IP_RTR_AZ_RT="10.9.8.1"
IP_RTR_AZ_IN="172.18.2.1"
IP_RTR_AZ_EX="192.168.18.202" # IP da rede local onde está ligado o virtualbox
IP_RTR_VM_RT="10.9.8.2"
IP_RTR_VM_IN="172.17.15.1"
IP_RTR_VM_EX="192.168.18.199" # IP da rede local onde está ligado o virtualbox

# Serviços
SSH="22"

# Limpa
function stop {
  ${IPT} -w -P INPUT ACCEPT
  ${IPT} -w -P FORWARD ACCEPT
  ${IPT} -w -P OUTPUT ACCEPT
  ${IPT} -w -F INPUT
  ${IPT} -w -F OUTPUT
  ${IPT} -w -F FORWARD
  ${IPT} -w -t nat -F INPUT
  ${IPT} -w -t nat -F OUTPUT
  ${IPT} -w -t nat -F POSTROUTING
  ${IPT} -w -t nat -F PREROUTING
}

function start {
  # Permite todo o tráfego interno
  ${IPT} -w -A INPUT -i lo -j ACCEPT
  ${IPT} -w -A OUTPUT -o lo -j ACCEPT

  # Permita acesso ao servidor web apenas do roteador ou local
  ${IPT} -w -N WebAccess
  ${IPT} -w -A WebAccess -s ${IP_RTR_AZ_RT} -j ACCEPT
  ${IPT} -w -A WebAccess -j REJECT
  ${IPT} -w -A INPUT -p tcp -m multiport --dports 80,443 -i ${IF_INT} -j WebAccess

  # Permita acesso via SSH do roteador azul e do cliente vermelho
  ${IPT} -w -N SSH
  ${IPT} -w -A SSH -s ${IP_RTR_AZ_IN} -j ACCEPT
  ${IPT} -w -A SSH -s ${IP_CLT_VM} -j ACCEPT
  ${IPT} -w -A SSH -j REJECT
}

cmd=$1
test -z "$cmd" && {
  cmd="start"
}

case "$cmd" in
  start)
    stop
    start
    RETVAL=$?
    ;;

  stop)
    stop
    RETVAL=$?
    ;;

  reload)
    $0 stop
    $0 start
    RETVAL=$?
    ;;

  *)
    echo "Usage $0 [start|stop|reload]"
    ;;

esac

exit $RETVAL

```

### Cliente Vermelho

* [X] Criar um script de firewall que:
    * [X] Bloqueie todos os serviços não essenciais

```bash
#!/bin/bash

IPT=$(which iptables)

# Interfaces
IF_INT="enp0s8"
IF_EXT="enp0s3"
IF_RTR="enp0s9"

# IPs
IP_CLT_AZ="172.18.2.2"
IP_CLT_VM="172.17.15.2"
IP_RTR_AZ_RT="10.9.8.1"
IP_RTR_AZ_IN="172.18.2.1"
IP_RTR_AZ_EX="192.168.18.202" # IP da rede local onde está ligado o virtualbox
IP_RTR_VM_RT="10.9.8.2"
IP_RTR_VM_IN="172.17.15.1"
IP_RTR_VM_EX="192.168.18.199" # IP da rede local onde está ligado o virtualbox

# Serviços
SSH="22"
ESSENCIAIS="${SSH} 80 443"

# Limpa
function stop {
  ${IPT} -w -P INPUT ACCEPT
  ${IPT} -w -P FORWARD ACCEPT
  ${IPT} -w -P OUTPUT ACCEPT
  ${IPT} -w -F INPUT
  ${IPT} -w -F OUTPUT
  ${IPT} -w -F FORWARD
  ${IPT} -w -t nat -F INPUT
  ${IPT} -w -t nat -F OUTPUT
  ${IPT} -w -t nat -F POSTROUTING
  ${IPT} -w -t nat -F PREROUTING
}

function start {
    # Permite todo o tráfego interno
  ${IPT} -w -A INPUT -i lo -j ACCEPT
  ${IPT} -w -A OUTPUT -o lo -j ACCEPT

  # Bloqueia todos os serviços não essenciais
  for p in ${ESSENCIAIS}; do
    ${IPT} -w -A INPUT -i ${IF_INT} -p tcp --dport ${p} -j ACCEPT
  done
  ${IPT} -w -A INPUT -j REJECT
}

cmd=$1
test -z "$cmd" && {
  cmd="start"
}

case "$cmd" in
  start)
    stop
    start
    RETVAL=$?
    ;;

  stop)
    stop
    RETVAL=$?
    ;;

  reload)
    $0 stop
    $0 start
    RETVAL=$?
    ;;

  *)
    echo "Usage $0 [start|stop|reload]"
    ;;

esac

exit $RETVAL

```

## Objetivos

[Objetivos](objetivos03.md)
