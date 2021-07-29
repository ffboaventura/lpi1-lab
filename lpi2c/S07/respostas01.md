---
template: index
title: Laboratório 07
sitename: LPIC-II - Laboratório 07
---

## Executando rotinas Docker 

* [X] Executar o container `hello-world`

```shell
$ docker run hello-world
```

* [X] Executar o container do `ubuntu`
* [X] Alterar container do `ubuntu` e publicar no Docker Hub 

```shell
$ mkdir meu-ubuntu
$ cd meu-ubuntu
$ docker pull ubuntu
$ docker run -ti --name meu-ubuntu ubuntu /bin/bash
```

```shell
root@cd016338e5f5$ apt update
root@cd016338e5f5$ apt install -y apache2
root@cd016338e5f5$ exit
```

```shell
$ wget http://172.31.7.54/S07/site.tar.gz
$ tar xvf site.tar.gz
$ cd site
$ docker cp . meu-ubuntu:/var/www/html/
$ cd ..
$ docker cp meu-ubuntu:/var/www/html .
$ ls html
$ docker export meu-ubuntu -o img-meu-ubuntu
$ docker import img-meu-ubuntu fboaventura/meu-ubuntu
$ docker cp meu-ubuntu:/etc/apache2/envvars .
$ docker run -dti --env-file envvars --name meu-app -p 8080:80 fboaventura/meu-ubuntu apachectl -k start
```

* [X] Criar imagem para publicar site usando `Dockerfile`

```shell
$ vi Dockerfile
```

```dockerfile
FROM httpd:2.4
COPY ./site/ /usr/local/apache2/htdocs/
```

```shell
$ docker build -t fboaventura/meu-app .
$ docker run -dti -p 8080:80 --name meu-app fboaventura/meu-app
```

```shell
$ docker run -dti -p 8081:80 --name outro-app -v ${PWD}/site/:/usr/local/apache2/htdocs/ httpd:2.4
```

**Modelo de Site**: [site.tar.bz2](site.tar.bz2) | [site.tar.gz](site.tar.gz)
