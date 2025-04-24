#!/bin/bash

# Perintah untuk membuat Docker image dari Dockerfile yang tadi dibuat, dengan nama image item-app, dan memiliki tag v1
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag item-app:v1 ghcr.io/cornel-yr/item-app:v1

# Login ke GitHub Packages via Terminal
# personal access token dengan izin read:packages, write:packages, dan delete:packages
echo $GITHUB_TOKEN | docker login ghcr.io -u cornel-yr --password-stdin

# Mengunggah image ke GitHub Packages
docker push ghcr.io/cornel-yr/item-app:v1