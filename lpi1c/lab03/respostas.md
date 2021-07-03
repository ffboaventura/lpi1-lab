# Lab-03 - Fluxo de texto e filtros

[Lista de Comandos](../comandos.md)

## Requisitos

### Pacotes:

- Ubuntu
    - fortune-mod

## Objetivos

### Bash

1. Como usuário:
    1. Identificar qual o shell está em execução

    ```
    aluno@ubuntu01:~$ echo $SHELL
    /bin/bash
    ```

    2. Qual é o login do usuário logado?

    ```
    aluno@ubuntu01:~$ echo $USER
    aluno
    ```

    3. Qual é o diretório atual?

    ```
    aluno@ubuntu01:~$ echo $PWD
    /home/aluno

    aluno@ubuntu01:~$ pwd
    /home/aluno
    ```

    4. Qual é o conteúdo da variável `HOME`?

    ```
    aluno@ubuntu01:~$ echo $HOME
    /home/aluno
    ```

2. Como `root` (`sudo su -`):
    1. Identificar qual o shell está em execução

    ```
    root@ubuntu01:~# echo $SHELL
    /bin/bash
    ```

    2. Qual é o login do usuário logado?

    ```
    root@ubuntu01:~# echo $USER
    root

    root@ubuntu01:~# whoami
    root
    ```

    3. Qual é o diretório atual?

    ```
    root@ubuntu01:~# echo $PWD
    /root
    ```

    4. Qual é o conteúdo da variável `HOME`?

    ```
    root@ubuntu01:~# echo $HOME
    /root
    ```

3. Configure uma variável de ambiente com o nome `EU` e armazene o seu nome

```
aluno@ubuntu01:~$ export EU="Frederico"
```

4. Visualize o conteúdo da variável `EU`

```
aluno@ubuntu01:~$ echo $EU
Frederico

```

5. Crie um __alias__ chamado `eu` que imprima o conteúdo da variável `EU`

```
aluno@ubuntu01:~$ alias eu="echo $EU"
```

6. Execute o __alias__ criado e veja o resultado.

```
aluno@ubuntu01:~$ eu
Frederico
```

### Comandos

1. Visualize o conteúdo do arquivo `/etc/ssh/sshd_config`

```
cat /etc/ssh/sshd_config
```

2. Visualize o início do arquivo `/etc/passwd`

```
aluno@ubuntu01:~$ head /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
```

3. Visualize o final do arquivo `/var/log/syslog`

```
aluno@ubuntu01:~$ tail /var/log/syslog
Jul  3 00:00:33 ubuntu01 rsyslogd: [origin software="rsyslogd" swVersion="8.2001.0" x-pid="27297" x-info="https://www.rsyslog.com"] rsyslogd was HUPed
Jul  3 00:00:33 ubuntu01 systemd[1]: logrotate.service: Succeeded.
Jul  3 00:00:33 ubuntu01 systemd[1]: Finished Rotate log files.
Jul  3 00:00:34 ubuntu01 systemd[1]: man-db.service: Succeeded.
Jul  3 00:00:34 ubuntu01 systemd[1]: Finished Daily man-db regeneration.

```

4. Conte a quantidade de linhas do arquivo `/etc/wgetrc`

```
aluno@ubuntu01:~$ wc -l /etc/wgetrc
138 /etc/wgetrc
```

5. Conte a quantidade de palavras do arquivo `/etc/hdparm.conf`

```
aluno@ubuntu01:~$ wc -w /etc/hdparm.conf
854 /etc/hdparm.conf
```

6. Divida o arquivo `/var/log/dpkg.log.1` em arquivos de **50k** com máscara `kern_`

```
aluno@ubuntu01:~$ split -b 50k /var/log/dpkg.log.1 kern_

aluno@ubuntu01:~$ ls -l kern_*
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_aa
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_ab
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_ac
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_ad
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_ae
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_af
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_ag
-rw-rw-r-- 1 aluno aluno 51200 Jul  3 00:26 kern_ah
-rw-rw-r-- 1 aluno aluno 14954 Jul  3 00:26 kern_ai

```

7. Numere as linhas com texto do arquivo `/etc/apache2/apache2.conf`

```
aluno@ubuntu01:~$ nl -bt /etc/apache2/apache2.conf
     1  # This is the main Apache server configuration file.  It contains the
     2  # configuration directives that give the server its instructions.
     3  # See http://httpd.apache.org/docs/2.4/ for detailed information about
     4  # the directives and /usr/share/doc/apache2/README.Debian about Debian specific
     5  # hints.
     6  #
     7  #
     8  # Summary of how the Apache 2 configuration works in Debian:
     9  # The Apache 2 web server configuration in Debian is quite different to
    10  # upstream's suggested way to configure the web server. This is because Debian's
    11  # default Apache2 installation attempts to make adding and removing modules,
    12  # virtual hosts, and extra configuration directives as flexible as possible, in
    13  # order to make automating the changes and administering the server as easy as
    14  # possible.

    15  # It is split into several files forming the configuration hierarchy outlined
    16  # below, all located in the /etc/apache2/ directory:
    17  #
    18  #       /etc/apache2/
[...]
```



### Desafio

No **Ubuntu** altere o arquivo de inicialização do shell para que mostre um `fortune` sempre que você fizer login.

**Dica**: Faça uma cópia do arquivo antes de editar:

```
cp .bashrc .bashrc.bkp
```


```
nano ~/.bashrc
```

Acrescente na última linha do arquivo o comando `fortune`:

```
aluno@ubuntu01:~$ tail .bashrc
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

fortune
```

```
Last login: Fri Jul  2 22:55:28 2021 from 192.168.18.2
"What's this?  Trix?  Aunt!  Trix?  You?  You're after the prize!  What
is it?"  He picked up the box and studied the back.  "A glow-in-the-dark
squid!  Have you got it out of there yet?"  He tilted the box, angling the
little colored balls of cereal so as to see the bottom, and nearly spilling
them onto the table top.  "Here it is!"  He hauled out a little cream-colored,
glitter-sprinkled squid, three-inches long and made out of rubbery plastic.
                -- James P. Blaylock, "The Last Coin"
```

------------
[Respostas](respostas.md)
