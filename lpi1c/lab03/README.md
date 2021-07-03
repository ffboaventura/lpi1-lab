# Lab-03 - Fluxo de texto e filtros

[Lista de Comandos](../comandos.md)

## Requisitos

### Pacotes:

- Ubuntu (`apt install`)
    - fortune-mod
- CentOS (`yum install`)
    - epel-release
    - fortune-mod

## Objetivos

### Bash

1. Como usuário:
    1. Identificar qual o shell está em execução
    2. Qual é o login do usuário logado?
    3. Qual é o diretório atual?
    4. Qual é o conteúdo da variável `HOME`?
2. Como `root` (`sudo su -`):
    1. Identificar qual o shell está em execução
    2. Qual é o login do usuário logado?
    3. Qual é o diretório atual?
    4. Qual é o conteúdo da variável `HOME`?
3. Configure uma variável de ambiente com o nome `EU` e armazene o seu nome
4. Visualize o conteúdo da variável `EU`
5. Crie um __alias__ chamado `eu` que imprima o conteúdo da variável `EU`
6. Execute o __alias__ criado e veja o resultado.

### Comandos

1. Visualize o conteúdo do arquivo `/etc/ssh/sshd_config`
2. Visualize o início do arquivo `/etc/passwd`
3. Visualize o final do arquivo `/var/log/syslog`
4. Conte a quantidade de linhas do arquivo `/etc/wgetrc`
5. Conte a quantidade de palavras do arquivo `/etc/hdparm.conf`
6. Divida o arquivo `/var/log/dpkg.log.1` em arquivos de **50k** com máscara `kern_`
7. Numere as linhas com texto do arquivo `/etc/apache2/apache2.conf`


### Desafio

No **Ubuntu** altere o arquivo de inicialização do shell para que mostre um `fortune` sempre que você fizer login.

**Dica**: Faça uma cópia do arquivo antes de editar:

```
cp .bashrc .bashrc.bkp
```


------------
[Respostas](respostas.md)
