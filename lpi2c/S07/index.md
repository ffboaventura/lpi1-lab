---
template: index
title: Laboratório 07
sitename: LPIC-II - Laboratório 07
---

## Configurando o ambiente

```shell
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ bash get-docker.sh
$ systemctl start docker
$ systemctl enable docker

$ docker volume create portainer_data
$ docker run -d -p 8000:8000 -p 9000:9000 \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v portainer_data:/data portainer/portainer

# Ubuntu
$ apt install -y git

# CentOS
$ yum install -y git

$ git clone https://github.com/docker/doodle.git
```

## Objetivos

* [Objetivos 01](objetivos01.md) | [Respostas](respostas01.md)
* [Objetivos 02](objetivos02.md) | [Respostas](respostas02.md)
