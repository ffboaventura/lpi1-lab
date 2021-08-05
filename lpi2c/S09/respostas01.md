---
template: index
title: Laboratório 08
sitename: LPIC-II - Laboratório 08
---

## Construindo ambiente com docker-compose

* [X] Configurar o `docker-compose.yml` para rodar o backend

```yaml
version: '3.3'

services:
  backend:
    image: fboaventura/lab-dj-backend
    build:
      context: backend
    environment:
      DB_BACKEND: sqlite3
    ports:
      - 8001:8081
    command: bash -c "python manage.py collectstatic --noinput && python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8081"

```

```shell
$ docker-compose up -d
```

* [X] Testar o acesso à API 

* Navegar para o link http://localhost:8000/api
