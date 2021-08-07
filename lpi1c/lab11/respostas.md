---
template: index
title: Lab-11 - Gerenciando o sistema
sitename: LPIC-I - Laboratório 01
---

[Lista de Comandos](../comandos.md)

## Requisitos

- N/A

## Objetivos

1. Altere o padrão de diretório home para as contas que serão criadas no sistema:
    1. Deve conter os diretórios: `bin`, `www`, `var` e `docs`

    ```bash
    sudo mkdir -p /etc/skel/{bin,www,var,docs}
    ```

    2. O arquivo `.bashrc` deve conter a chamada para o comando `fortune -s`

    ```bash
    sudo nano /etc/skel/.bashrc

    fortune -s
    ```

    3. Deve conter um arquivo de boas vindas ao novo usuário

    ```bash
    sudo nano /etc/skel/bemvindo.txt

    Olá! Bem vindo ao servidor.
    ```

    4. E no diretório `www` deve ter um arquivo chamado `index.html` com o seguinte conteúdo:

        ```bash
        sudo touch /etc/skel/www/index.html
        sudo chmod +w /etc/skel/www/index.html
        cat <<_EOF_ > /etc/skel/www/index.html
        <html>
            <head>
            <title>Página Pessoal</title>
            </head>
            <body>
                <h1>Oops!</h1>
                <p>A página pessoal que deveria estar aqui não chegou ainda... Volte mais tarde!</p>
            </body>
        </html>
        _EOF_
        sudo chmod 0644 /etc/skel/www/index.html
        ```

1. Crie os grupos: `comercial`, `compras`, `administrativo` e `ti`

  ```bash
  for nome in comercial compras administrativo ti; do sudo groupadd ${nome}; done
  ```

1. Crie os usuários abaixo com as características determinadas:
    1. login: `joao`, grupo principal: `comercial`

      ```bash
      sudo useradd -c "Joao" -d /home/joao -m -s /bin/bash -g comercial joao
      ```

    1. login: `marcos`, grupo principal: `compras`

      ```bash
      sudo useradd -c "Marcos" -d /home/marcos -m -s /bin/bash -g compras marcos
      ```

    1. login: `maria`, grupo principal: `administrativo`

      ```bash
      sudo useradd -c "Maria" -d /home/maria -m -s /bin/bash -g administrativo maria
      ```

    1. login: `celio`, grupo principal: `ti`

      ```bash
      sudo useradd -c "Celio" -d /home/celio -m -s /bin/bash -g ti celio
      ```

    ```bash
    for usr in joao:comercial marcos:compras maria:administrativo celio:ti; do
      login=$(echo $usr | cut -d: -f1)
      grupo=$(echo $usr | cut -d: -f2)
      sudo useradd -c "$login" -d /home/$login -m -s /bin/bash -g $grupo $login
    done
    ```

1. Acrescente os usuários aos grupos conforme determinado:
    1. login `joao` ao grupo `administrativo`

      ```bash
      sudo gpasswd -a joao administrativo
      ```

    1. login `marcos` aos grupos `administrativo` e `ti`

      ```bash
      sudo gpasswd -a marcos administrativo
      sudo gpasswd -a marcos ti
      ```

    1. login `maria` ao grupo `compras`

      ```bash
      sudo gpasswd -a maria compras
      ```

    1. login `celio` ao grupo `www-data` ou `http`

      ```bash
      sudo gpasswd -a celio www-data
      ```

1. Cadastre senhas para todos os usuários

      ```bash
      sudo passwd joao
      sudo passwd marcos
      sudo passwd maria
      sudo passwd celio
      ```

1. Crie uma tarefa cron para os usuários `celio` e `marcos` que grave a lista do diretório `${HOME}/www` para o arquivo `/tmp/<login>_www.log` a cada `10 minutos`

      ```bash
      echo "*/10 * * * * ls -l ${HOME}/www > /tmp/`whoami`_www.log" > /tmp/cron
      sudo crontab -u celio /tmp/cron
      sudo crontab -u marcos /tmp/cron
      ```

1. Verifique se a data do sistema está correta

  ```bash
  date
  timedatectl
  ```

1. Verifique se o relógio do sistema está configurado para atualizar automaticamente

  ```bash
  timedatectl
  ```

1. Veja os logs do sistema atual

  ```bash
  sudo journalctl
  sudo less /var/log/syslog
  ```

1. Acompanhe os logs do servidor Apache

  ##### Ubuntu

  ```bash
  sudo journalctl -f -u apache2
  tail -vf /var/log/apache2/*.log
  ```

  ##### CentOS

  ```bash
  sudo journalctl -f -u httpd
  tail -vf /var/log/httpd/*_log
  ```



------------
[Respostas](respostas.md)
