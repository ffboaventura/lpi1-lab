# Lab-06 - Encontrando arquivos e redirecionamentos

[Lista de Comandos](../comandos.md)

## Requisitos

- Instalar o pacote s-nail

## Objetivos

1. Encontre os diretórios que estão dentro do caminho `/etc`
2. Encontre os arquivos dentro do `/var` que pertencem ao usuário `syslog`
3. Encontre os diretórios no filesystem (`/`) que pertencem ao grupo `daemon`
4. Encontre no diretório `/etc` todos os arquivos que são mais novos que o `/etc/passwd` e gere o `md5sum` deles no arquivo `/home/aluno/etc_novo.md5`
5. Encontre no diretório `/var` todos os arquivos que foram modificados nos últimos 60 minutos
6. Encontre no diretório `/var` todos os arquivos que foram acessados a mais de 10 dias
7. Encontre no diretório `/var` todos os arquivos que terminem em `.md5sums`
8. Faça uma busca no diretório `/etc` e armazene em um log quais arquivos ou diretórios o usuário `aluno` não tem permissão para acessar
9. Utilizando o `s-nail`, envie o log do comando anterior por e-mail, utilizando o redirecionamento de entrada
    ```s-nail -s "Logs" aluno```



------------
[Respostas](respostas.md)
