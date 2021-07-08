# Lab-07 - Gerenciando processos

- [Lista de Comandos](../comandos.md)
- [Cheat Sheets](../../cheatsheets) - Tabelas com resumos de comandos
    - [screen](../../cheatsheets/screen.md) - Utilização do screen
    - [tmux](../../cheatsheets/tmux.md) - Utilização do tmux

## Requisitos

Pacotes:
- Ubuntu: screen e tmux
- CentOS: screen, tmux e psmisc


## Objetivos

1. Visualize a lista de processos do seu servidor

```
ps -ef
```

```
ps -aux
```

2. Quantos processos estão em execução no seu servidor?

Ubuntu:
```
aluno@ubuntu01:~$ ps -ef | wc -l
104
```

CentOS:
```
[aluno@centos01 ~]$ ps -ef | wc -l
107
```


3. Visualize a lista de processos em formato de árvore

```
pstree
```

```
ps -efH
```

4. Identifique se o processo do Apache está em execução
    1. CentOS: `httpd`

```
[aluno@centos01 ~]$ ps -ef | grep httpd
```

```
[aluno@centos01 ~]$ pidof httpd
```

```
[aluno@centos01 ~]$ pgrep httpd -a
```

    2. Ubuntu: `apache2`

```
aluno@ubuntu01:~$ ps -ef | grep apache2
```

```
aluno@ubuntu01:~$ pidof apache2
```

```
pgrep apache2 -a
```

5. Quantos processos do apache estão em execução?

Ubuntu:
```
aluno@ubuntu01:~$ pgrep httpd | wc -l
3
```

CentOS:
```
[aluno@centos01 ~]$ pgrep httpd | wc -l
6
```

6. Qual(is) é(são) o(s) PID(s) do(s) processo(s) do apache?

Ubuntu:
```
1326 1325 732
```

CentOS:
```
1289 1288 1287 1286 1285 1284
```

7. Qual é o PID do processo de origem (pai) do apache?

Ubuntu:
```
732
```

CentOS:
```
1284
```

8. Caso haja mais de um, escolha um dos processos e "mate"

Ubuntu:
```
aluno@ubuntu01:~$ sudo kill -9 1325
aluno@ubuntu01:~$ pidof apache2
1326 732
```

CentOS:
```
[aluno@centos01 ~]$ sudo kill -9 1287
[aluno@centos01 ~]$ pidof httpd
2109 1289 1288 1286 1285 1284
```

9. Qual foi o resultado?

Ubuntu:
```
O apache ficou com apenas dois processos em execução
```

CentOS:
```
O processo morto foi substituído por um novo
```

10. Utilizando o `tmux`, divida a tela em duas:
    1. Em uma das telas acompanhe o arquivo de log do apache

Ubuntu
```
aluno@ubuntu01:~$ tmux
Ctrl+b %
Ctrl+b ->
aluno@ubuntu01:~$ sudo tail -vf /var/log/apache2/*.log
```

CentOS
```
[aluno@centos01 ~]$ tmux
Ctrl+b %
Ctrl+b ->
[aluno@centos01 ~]$ sudo tail -vf /var/log/httpd/*_log
```

    2. Na outra tela, escolha e mate um dos processos do apache

```
Ctrl+b <-
aluno@ubuntu01:~$ sudo kill -9 732
aluno@ubuntu01:~$ pidof apache2
1536
```

    3. Qual foi o resultado no arquivo de log?

Ubuntu
```
Nenhuma alteração no arquivo de logs
```

CentOS
```
Nenhuma alteração no arquivo de logs
```

    4. O que acontece se todos os processos forem mortos?

Ubuntu
```
O serviço foi reiniciado, houve uma entrada nos logs sobre o reinicio do serviço e os três processos iniciais voltaram
```

CentOS
```
O serviço entrou em modo de falha e não foi reiniciado.
```



------------
[Respostas](respostas.md)
