#!/bin/bash
# Script untuk build dan push docker image karsajobs-ui (frontend)

#Username GitHub
GITHUB_USERNAME="cornel-yr"

# Nama image dan tag
IMAGE_NAME="karsajobs-ui"
IMAGE_TAG="latest"

# Full image path untuk GitHub Container Registry
FULL_IMAGE_NAME="ghcr.io/${GITHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

# Build Docker image
echo "Building Docker image: ${FULL_IMAGE_NAME}"
docker build \
    --label "org.opencontainers.image.source=https://github.com/${GITHUB_USERNAME}/a433-microservices" \
    -t ${FULL_IMAGE_NAME} .

# Perintah untuk melihat local Docker images untuk verifikasi
echo "Listing Docker images..."
docker images

# login ke GitHub Container Registry
# export GITHUB_TOKEN=<token>
echo "Logging in to GitHub Container Registry..."
echo $GITHUB_TOKEN | docker login ghcr.io -u ${GITHUB_USERNAME} --password-stdin

# Push image ke GitHub Container Registry
echo "Pushing image to GitHub Container Registry: ${FULL_IMAGE_NAME}"
docker push ${FULL_IMAGE_NAME}

echo "Build and push process completed successfully!"