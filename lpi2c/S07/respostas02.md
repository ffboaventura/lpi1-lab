---
template: index
title: Laboratório 07
sitename: LPIC-II - Laboratório 07
---

## Executando rotinas Docker 

* [X] Construir imagens do projeto `doodle`

```shell
$ cd doodle
$ for name in birthday cheers halloween summer; do
    docker build -t fboaventura/doodle:${name} ${name}2019
done 
```

* [X] Executar containers com os `doodles`

```shell
$ docker run -ti --rm --name doodle fboaventura/doodle:birthday
$ docker run -ti --rm --name doodle fboaventura/doodle:cheers
$ docker run -ti --rm --name doodle fboaventura/doodle:summer
$ docker run -ti --rm --name doodle fboaventura/doodle:halloween
```
