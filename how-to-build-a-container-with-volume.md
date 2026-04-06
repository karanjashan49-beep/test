# How to Build a Container with Volume

## Overview
A Docker volume lets you persist data outside the container. This means your data stays safe even if the container stops, is removed, or recreated.

## Prerequisites
- Docker installed
- Basic knowledge of Docker commands
- A project directory with a `Dockerfile`

## Example Dockerfile
Create a file named `Dockerfile`:

```Dockerfile
FROM nginx:latest
COPY . /usr/share/nginx/html
```

## Build the Image
Run:

```bash
docker build -t my-container .
```

This creates a Docker image named `my-container`.

## Run the Container with a Volume
Run:

```bash
docker run -d \
  --name my-nginx-container \
  -p 8080:80 \
  -v mydata:/usr/share/nginx/html \
  my-container
```

## Command Explanation
- `-d` → runs the container in detached mode
- `--name my-nginx-container` → assigns a name to the container
- `-p 8080:80` → maps port 8080 on the host to port 80 in the container
- `-v mydata:/usr/share/nginx/html` → mounts the Docker volume `mydata`

## Check the Volume
List all volumes:

```bash
docker volume ls
```

Inspect a volume:

```bash
docker volume inspect mydata
```

## Stop and Remove the Container
```bash
docker stop my-nginx-container
docker rm my-nginx-container
```

The volume remains even after the container is removed.

## Remove the Volume
```bash
docker volume rm mydata
```

## Conclusion
Using Docker volumes helps you persist container data safely and makes it easier to rebuild or recreate containers without losing important files.
