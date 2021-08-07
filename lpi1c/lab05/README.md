---
template: index
title: Lab-05 - Gerenciamento básico de arquivos
sitename: LPIC-I - Laboratório 01
---

[Lista de Comandos](../comandos.md)

## Requisitos

N/A

## Objetivos

1. Criar o diretório `scripts` no `home` do aluno
2. Criar os diretórios `tmp`, `etc`, `bin`, `var`, `var/log`, `var/lib` e `var/backup` dentro do diretório `scripts`
3. Seguindo esta árvore de diretórios:
    1. Copiar todos os arquivos que começam com `host` do `/etc` para o `etc`
    2. Criar um arquivo compactado com `gzip` contendo todo os arquivos do `/etc` dentro do diretório `var/backup`
    3. Copiar todos os arquivos que terminam com `log` do `/var/log` para o `var/log`
    4. Criar 9 arquivos sequenciais no diretório `var/lib`
    5. Copiar os arquivos `/etc/passwd`, `/etc/group` e `/etc/crontab` para o `etc`
4. Fazer um backup da árvore de diretório criada no `scripts` no `home` do aluno, sem a pasta `scripts`
5. Gerar o __checksum__ utilizando o `md5` para o arquivo de backup criado
6. Criar um diretório `scripts2` no home do aluno
7. Restaurar o backup dentro do diretório `scripts2` e verificar se os arquivos estão
8. Comparar os arquivos do `scripts/etc` com do `scripts2/etc`


------------
[Respostas](respostas.md)
