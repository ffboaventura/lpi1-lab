# Lab-01 - Discos, Partições e Arquivos de Sistemas

[Lista de Comandos](../comandos.md)

### Requisitos

N/A

## Objetivos


1. Atualizar os pacotes instalados na máquina

### CentOS

```
sudo yum update
```

### Ubuntu

```
sudo apt update
sudo apt upgrade
```

2. Instalar os pacotes:
    1. vim
    2. nano
    3. curl
    4. wget


### CentOS

```
sudo yum install vim nano curl wget
```

### Ubuntu

```
sudo apt install vim nano curl wget
```

3. Buscar o pacote `docker`

### CentOS

```
yum search docker
```

### Ubuntu

```
apt search docker
```

4. Buscar o pacote `nano`

### CentOS

```
rpm -q nano
```

### Ubuntu

```
dpkg -l nano
```

5. Listar o conteúdo do pacote `curl`

### CentOS

```
rpm -ql curl
```

### Ubuntu

```
dpkg -L curl
```

----------------
[Voltar](README.md)
