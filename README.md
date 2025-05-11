# Dockerfile templates

## Basic dockerfiles to complex

## Building docker files

```bash
docker build -t image_name:tag .
```

To run:
```bash
docker run [options] image_name:tag

# Common options:
# -d, --detach        Run container in background
# -p, --publish       Publish container's port to the host
# -v, --volume        Bind mount a volume
# --name              Assign a name to the container
# --rm                Remove container when it exits
```

## Using Docker Compose

Docker Compose allows you to define and run multi-container Docker applications.

Example `docker-compose.yml`:

```yaml
services:
    web:
        build:
            context: .
            dockerfile: dockerfile
        ports:
            - "8000:8000"
        restart: unless-stopped
    db:
        image: postgres
        environment:
            POSTGRES_PASSWORD: example
        restart: unless-stopped
```

To run:
```bash
docker compose up -d
```

To build and run:
```bash
docker compose up -d --build
```
