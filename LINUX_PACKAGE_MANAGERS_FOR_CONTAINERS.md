# LINUX PACKAGE MANAGERS FOR CONTAINERS

This file is a simple cheat sheet for package managers commonly used in container images.

## 1. Alpine Linux

- Package manager: `apk`
- Common in very small container images
- Good when you want lightweight containers

Example:

```bash
apk add --no-cache curl
```

Containerfile example:

```Dockerfile
FROM alpine:latest
RUN apk add --no-cache curl
```

## 2. Ubuntu / Debian

- Package manager: `apt` or `apt-get`
- Common in beginner-friendly and general-purpose images
- Often easier when packages and tutorials are written for Ubuntu

Example:

```bash
apt update && apt install -y curl
```

Containerfile example:

```Dockerfile
FROM ubuntu:latest
RUN apt update && apt install -y curl
```

## 3. RHEL / CentOS / Fedora

- Package manager: `dnf` or `yum`
- Common in Red Hat based systems
- `dnf` is common in newer versions
- `yum` may still appear in some older images or guides

Example with dnf:

```bash
dnf install -y curl
```

Example with yum:

```bash
yum install -y curl
```

Containerfile example:

```Dockerfile
FROM registry.access.redhat.com/ubi9/ubi
RUN dnf install -y curl
```

## 4. Quick comparison

- Alpine → `apk`
- Ubuntu/Debian → `apt`
- RHEL/CentOS/Fedora → `dnf` or `yum`

## 5. Important idea

The package manager depends on the Linux distribution used in the base image.

Examples:

- `FROM alpine:latest` → use `apk`
- `FROM ubuntu:latest` → use `apt`
- `FROM registry.access.redhat.com/ubi9/ubi` → use `dnf`

## 6. Simple rule

Before installing packages in a container, first check which base image you are using.

Then use the correct package manager for that image.
