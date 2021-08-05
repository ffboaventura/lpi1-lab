---
template: index
title: Laboratório 08
sitename: LPIC-II - Laboratório 08
---

## Construindo ambiente com docker-compose

* [X] Alterar o `docker-compose.yml` para garantir persistência dos dados
* [X] Alterar o `docker-compose.yml` para alterar porta de acesso da aplicação

```yaml
version: '3.3'

services:
  backend:
    image: fboaventura/lab-dj-backend
    build:
      context: backend
    environment:
      DB_PASS: askdjow2ojdakjshieuawoijeldjkasnweubwy
      DB_BACKEND: postgresql_psycopg2
      DB_HOST: db
      DB_PORT: 5432
      DB_NAME: todo
      DB_USER: todo
    ports:
      - 8081:8081
    links:
      - db
    depends_on:
      - db
    command: bash -c "python manage.py collectstatic --noinput && python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8081"

  frontend:
    image: fboaventura/lab-node-frontend
    build:
      context: frontend
    links:
      - backend
    depends_on:
      - db
      - backend
    ports:
      - 80:3000
    environment:
      SKIP_PREFLIGHT_CHECK: 'true'

  db:
    image: postgres:12-alpine
    environment:
      POSTGRES_PASSWORD: askdjow2ojdakjshieuawoijeldjkasnweubwy
      DB_SCHEMA: postgres
      POSTGRES_HOST: postgres
      POSTGRES_PORT: 5432
      POSTGRES_DB: todo
      POSTGRES_USER: todo
      PGDATA: /var/lib/postgresql/data/pgdata
    volumes:
      - pgsql:/var/lib/postgresql/data/pgdata

volumes:
   pgsql:
```

```shell
$ docker-compose up -d
```

* [X] Testar o acesso à Aplicação

* Acessar a aplicação no endereço http://localhost
