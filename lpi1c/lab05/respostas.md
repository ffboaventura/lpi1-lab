# Lab-05 - Gerenciamento básico de arquivos

[Lista de Comandos](../comandos.md)

## Requisitos

N/A

## Objetivos

1. Criar o diretório `scripts` no `home` do aluno

```
mkdir -p ~/scripts
```

2. Criar os diretórios `tmp`, `etc`, `bin`, `var`, `var/log`, `var/lib` e `var/backup` dentro do diretório `scripts`

```
cd ~/scripts
mkdir -p {tmp,etc,bin} var/{log,lib,backup}
```

3. Seguindo esta árvore de diretórios:

  1. Copiar todos os arquivos que começam com `host` do `/etc` para o `etc`

  ```
  cp /etc/host* etc
  ```

  2. Criar um arquivo compactado com `gzip` contendo todo os arquivos do `/etc` dentro do diretório `var/backup`

  ```
  tar czvf var/backup/etc.tar.gz /etc
  ```

  3. Copiar todos os arquivos que terminam com `log` do `/var/log` para o `var/log`

  ```
  cp /var/log/*log var/log
  ```

  4. Criar 9 arquivos sequenciais no diretório `var/lib`

  ```
  touch var/lib/arq_{1..9}
  ```

  5. Copiar os arquivos `/etc/passwd`, `/etc/group` e `/etc/crontab` para o `etc`

  ```
  cp /etc/{passwd,group,crontab} etc
  ```

4. Fazer um backup da árvore de diretório criada no `scripts` no `home` do aluno, sem a pasta `scripts`

```
tar czvf ../scripts.tar.gz *
```

5. Gerar o __checksum__ utilizando o `md5` para o arquivo de backup criado

```
cd ~
md5sum scripts.tar.gz > scripts.tar.gz.md5
```

6. Criar um diretório `scripts2` no home do aluno

```
mkdir /home/aluno/scripts2
```

7. Restaurar o backup dentro do diretório `scripts2` e verificar se os arquivos estão

```
cd ~/scripts2
tar xzvf ~/scripts.tar.gz
```

8. Comparar os arquivos do `scripts/etc` com do `scripts2/etc`

```
cd ~/scripts
md5sum etc/* > ~/scripts2/etc.md5
cd ~/scripts2
md5sum -c etc.md5
```

------------
[Respostas](respostas.md)
