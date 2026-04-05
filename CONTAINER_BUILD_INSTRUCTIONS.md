# CONTAINER BUILD INSTRUCTIONS

This file explains a simple way to build and run a container image.

## 1. Create a Containerfile

A `Containerfile` (or `Dockerfile`) defines how the image is built.

Example:

```Dockerfile
FROM alpine:latest

RUN apk add --no-cache curl

CMD ["sh"]
```

## 2. Build the container image

Use one of the following commands from the directory containing the `Containerfile`.

### With Podman

```bash
podman build -t my-image:latest .
```

### With Docker

```bash
docker build -t my-image:latest .
```

## 3. Run the container

### With Podman

```bash
podman run --rm -it my-image:latest
```

### With Docker

```bash
docker run --rm -it my-image:latest
```

## 4. Notes

- `-t my-image:latest` gives your image a name and tag.
- `.` means build using the current directory as the build context.
- You can replace `my-image:latest` with any name you want.
- If you use Podman, the file can be named `Containerfile`.
- If you use Docker, `Dockerfile` is the common name.

## 5. Recommended project structure

```text
project-folder/
├── Containerfile
└── app-files
```

## 6. Example build workflow

```bash
cd project-folder
podman build -t demo-app:latest .
podman run --rm -it demo-app:latest
```

## 7. Node.js example

Example `Containerfile` for a Node.js app:

```Dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
```

Build it:

```bash
podman build -t node-app:latest .
```

Run it:

```bash
podman run --rm -p 3000:3000 node-app:latest
```

## 8. Python example

Example `Containerfile` for a Python app:

```Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
```

Build it:

```bash
podman build -t python-app:latest .
```

Run it:

```bash
podman run --rm -it python-app:latest
```

## 9. Push to a container registry

After building the image, you can push it to a registry.

### Docker Hub example

Tag the image:

```bash
docker tag my-image:latest yourdockerhubusername/my-image:latest
```

Push it:

```bash
docker push yourdockerhubusername/my-image:latest
```

### GitHub Container Registry example

Tag the image:

```bash
docker tag my-image:latest ghcr.io/your-github-username/my-image:latest
```

Log in:

```bash
echo YOUR_GITHUB_TOKEN | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin
```

Push it:

```bash
docker push ghcr.io/your-github-username/my-image:latest
```

Make sure you have permission to push to the target registry before uploading images.
