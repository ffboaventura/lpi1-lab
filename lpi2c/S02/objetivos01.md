---
template: index
title: Laboratório 02
sitename: LPIC-II - Laboratório 02
---

## Configuração dos roteadores

* [ ] Fazer inspeção dos pacotes e garantiar conectividade entre os servidores
* [ ] Configurar DNS para acrescentar nomes dos hosts

## Configuração dos clientes

* [ ] Configuração básica do Apache
  * [ ] Testar acesso de um cliente para o outro (wget ou curl) através do IP
  * [ ] Testar acesso de um cliente para o outro (wget ou curl) através do hostname

* [ ] Configurar Hosts Virtuais
   * [ ] Configurar um `VirtualHost` para servir o site `www.dominio.corp`
   * [ ] Configurar um `VirtualHost` para servir o site `dev.dominio.corp`
   * [ ] Utilizar o modelo de site para os dois `VirtualHost` a partir de diretórios diferentes 
   

**Modelo de Site**: [site.tar.bz2](site.tar.bz2) | [site.tar.gz](site.tar.gz)

Comandos básicos para operação do Apache:

  * `apache2ctl` / `apachectl`: Gerencia a inicialização e interação com o Daemon do apache
  * `a2enmod` / `a2dismod`: Habilita ou desabilita módulos adicionais
  * `a2ensite` / `a2dissite`: Habilita ou desabilita configurações de sites (hosts virtuais)
  * `a2enconf` / `a2disconf`: Habilita ou desabilita configurações adicionais
  
## Respostas

[Respostas](respostas01.md)
