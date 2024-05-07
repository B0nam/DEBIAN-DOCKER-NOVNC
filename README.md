# DEBIAN-DOCKER-NOVNC

This repository contains Dockerfiles to generate Debian images equipped with NOVNC (HTML5 VNC client).

## Overview

This repository offers a collection of Dockerfiles to create Debian-based Docker images with integrated NOVNC support. NOVNC facilitates remote access to graphical desktop environments via web browsers, offering flexibility and convenience for various visualization tasks.

### Base

The Base image contains only the necessary packages and installations to set up a NOVNC server.

### Fluxbox

The Fluxbox image contains the Fluxbox window manager, providing a lightweight and customizable environment for users.

### Xfce4

The Xfce4 image contains the Xfce4 window manager, offering a user-friendly and feature-rich desktop environment.

## Usage

### Build and run
To utilize these Dockerfiles:

1. Navigate to the desired subfolder (`Base`, `Fluxbox`, or `Xfce4`).
2. Build the Docker image using the provided Dockerfile:

```bash
docker build -t <image_name> .
```

Replace `<image_name>` with your preferred name for the image.

3. Once the image is built, run it using the following command:

```bash
docker run -d -p 8080:8080 <image_name>
```

### Or Pull image from dockerhub

```bash
docker run -d -p 8080:8080 b0nam/debian-novnc:<image_tag>
```

Access the NOVNC interface by opening a web browser and navigating to `http://localhost:8080`.