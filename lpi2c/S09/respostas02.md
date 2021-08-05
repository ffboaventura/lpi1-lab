---
template: index
title: Laboratório 08
sitename: LPIC-II - Laboratório 08
---

## Construindo ambiente com docker-compose

* [X] Alterar o `docker-compose.yml` para incluir o frontend

```yaml
version: '3.3'

services:
  backend:
    image: fboaventura/lab-dj-backend
    build:
      context: backend
    environment:
      DB_BACKEND: sqlite3
    command: bash -c "python manage.py collectstatic --noinput && python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8081"

  frontend:
    image: fboaventura/lab-node-frontend
    build:
      context: frontend
    links:
      - backend
    ports:
      - 3000:3000
    environment:
      SKIP_PREFLIGHT_CHECK: 'true'
```

```shell
$ docker-compose up -d
```

* [X] Testar o acesso à Aplicação

* Acessar a aplicação no endereço http://localhost:3000
