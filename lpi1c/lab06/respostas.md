# Lab-06 - Encontrando arquivos e redirecionamentos

[Lista de Comandos](../comandos.md)

## Requisitos

- Instalar o pacote s-nail

## Objetivos

1. Encontre os diretórios que estão dentro do caminho `/etc`

  ```
  find /etc -type d

  sudo find /etc -type d
  ```

2. Encontre os arquivos dentro do `/var` que pertencem ao usuário `syslog`

  ```
  find /var -type f -user syslog

  sudo find /var -type f -user syslog
  ```

3. Encontre os diretórios no filesystem (`/`) que pertencem ao grupo `daemon`

  ```
  sudo find / -type d -group daemon
  ```

4. Encontre no diretório `/etc` todos os arquivos que são mais novos que o `/etc/passwd` e gere o `md5sum` deles no arquivo `/home/aluno/etc_novo.md5`

  ```
  sudo find /etc -newer /etc/passwd -exec md5sum {} \; >> /home/aluno/etc_novo.md5
  ```

5. Encontre no diretório `/var` todos os arquivos que foram modificados nos últimos 60 minutos

  ```
  sudo find /var -type f -mmin -60
  ```

6. Encontre no diretório `/var` todos os arquivos que foram acessados a mais de 10 dias

  ```
  sudo find /var -type f -atime +10
  ```

7. Encontre no diretório `/var` todos os arquivos que terminem em `.md5sums` e verifique o `checksum` dos arquivos, salvando o resultado no arquivo `/home/aluno/verifica_checksums.log`

  ```
  cd /
  sudo find /var -type f -name "*.md5sums" | xargs md5sum -c 1> /home/aluno/verifica_checksums.log
  ```

8. Faça uma busca no diretório `/etc` e armazene em um log quais arquivos ou diretórios o usuário `aluno` não tem permissão para acessar

  ```
  find /etc 1>/dev/null 2>/home/aluno/nao_acessa.log

  find /etc 2>&1 | egrep "Permission denied" >/home/aluno/nao_acessa.log
  ```

9. Utilizando o `s-nail`, envie o log do comando anterior por e-mail, utilizando o redirecionamento de entrada
    ```
    s-nail -s "Logs" aluno </home/aluno/nao_acessa.log
    ```



------------
[Respostas](respostas.md)
