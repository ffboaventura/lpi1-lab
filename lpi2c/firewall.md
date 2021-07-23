---
template: index
title: IPTables Firewall
sitename: LPIC-II - IPTables Firewall
---

```bash
#!/bin/bash
IPTABLES=$(which iptables)
IF_OUT="enp3s0"
IF_LAN="enp2s0"
IF_DMZ="ens33"

# MANGLE
${IPTABLES} -t mangle -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

# NAT
${IPTABLES} -t nat -I POSTROUTING -s 192.168.0.0/24 -o ${IF_OUT} -j MASQUERADE

# Controle WWW Saida
${IPTABLES} -N ControlHTTP
for ip in ${HTTP_DST_ALLOWED}; do
    ${IPTABLES} -A ControlHTTP -d ${ip} -j ACCEPT
done
${IPTABLES} -A ControlHTTP -j REJECT
${IPTABLES} -I FORWARD -s ${LAN_IPV4} -o ${IF_OUT} -p tcp -m multiport --dports 80,443 -j ControlHTTP
${IPTABLES} -I FORWARD -s ${LAN_IPV4} -o net -p tcp -m multiport --dports 80,443 -j ControlHTTP

# Maquinas FULL
${IPTABLES} -N FullAccess
${IPTABLES} -I FORWARD -j FullAccess
for mac in ${MACS_FULL}; do
    ${IPTABLES} -A FullAccess -m mac --mac-source ${mac} -j ACCEPT
done
${IPTABLES} -A FullAccess -j RETURN

# Regras de liberacao dos servidores
${IPTABLES} -N Srvs_Out
${IPTABLES} -I FORWARD -i ${IF_LAN} -j Srvs_Out
for srv in ${ALL_SRVS}; do
    ${IPTABLES} -A Srvs_Out -s ${srv} -j ACCEPT
done
${IPTABLES} -A Srvs_Out -j RETURN

# Regras para servidor de e-mail
${IPTABLES} -N Mail
${IPTABLES} -I FORWARD -i net -j Mail
${IPTABLES} -I FORWARD -i ${IF_OUT} -j Mail
for srv in ${MAIL}; do
    ${IPTABLES} -A Mail -p tcp --dport ${srv} -d ${MAILSRV} -j ACCEPT
    ${IPTABLES} -t nat -I PREROUTING -i net -p tcp --dport ${srv} -j DNAT --to ${MAILSRV}
    ${IPTABLES} -t nat -I PREROUTING -i ${IF_OUT} -p tcp --dport ${srv} -j DNAT --to ${MAILSRV}
done
${IPTABLES} -A Mail -j RETURN

# Regras de servicos no Firewall
${IPTABLES} -N Servicos
${IPTABLES} -I INPUT -j Servicos

# Permite acessos da Lan aos servicos do firewall
for ${IF_LAN} in ${LAN} ${VPN}; do
    for svc in ${INT_TCP_SVC}; do
        ${IPTABLES} -A Servicos -i ${${IF_LAN}} -p tcp --dport ${svc} -j ACCEPT
    done
    for svc in ${INT_UDP_SVC}; do
        ${IPTABLES} -A Servicos -i ${${IF_LAN}} -p udp --dport ${svc} -j ACCEPT
    done
done

# Permite acessos da Wan aos servicos do firewall
for wan in ${NET} ${${IF_OUT}}; do
    for svc in ${EXT_TCP_SVC}; do
        ${IPTABLES} -A Servicos -i ${wan} -p tcp --dport ${svc} -j ACCEPT
    done
    for svc in ${EXT_UDP_SVC}; do
        ${IPTABLES} -A Servicos -i ${wan} -p udp --dport ${svc} -j ACCEPT
    done
done

# Permite acesso da máquina Docker ao SNMP
${IPTABLES} -A Servicos -s ${DCKR_IPv4} -p udp --dport 161 -j ACCEPT

${IPTABLES} -A Servicos -m limit --limit 20/min -j LOG --log-prefix "SVCS: "
${IPTABLES} -A Servicos -j REJECT

# Regra de protecao GreenGeeks - PRECISA SER A ULTIMA
${IPTABLES} -N GreenGeeks
for port in ${MAIL_PORTS}; do
    ${IPTABLES} -A GreenGeeks -p tcp --dport ${port} -j ACCEPT
done
${IPTABLES} -A GreenGeeks -m limit --limit 5/min -j LOG --log-prefix "GGEEKS: "
${IPTABLES} -A GreenGeeks -j REJECT
${IPTABLES} -I FORWARD -d ${GREENGEEKS} -j GreenGeeks
${IPTABLES} -I OUTPUT -d ${GREENGEEKS} -j GreenGeeks

${IPTABLES} -I INPUT -i lo -j ACCEPT

${IPTABLES} -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# IPSETS
${IPSET} create scanners hash:net
for ip in `cat ${scanners}`; do
    ${IPSET} add scanners ${ip}
done
${IPTABLES} -I INPUT -m set --match-set scanners src -j REJECT

```