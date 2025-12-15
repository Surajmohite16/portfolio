#!/bin/bash
IMAGE_REPO="iamsuraj314/portfolio"
CONTAINER_NAME="portfolio-app"

# 1. Stop and remove any existing container
echo "Stopping and removing existing container..."
if [ $(docker ps -a -q -f name=$CONTAINER_NAME) ]; then
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# 2. Pull the latest image from Docker Hub
echo "Pulling latest image: $IMAGE_REPO:latest"
docker pull $IMAGE_REPO:latest

# 3. Run the new container (maps host port 80 to container port 80)
echo "Starting new container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 80:80 \
  $IMAGE_REPO:latest

# Clean up old images (optional)
echo "Cleaning up dangling images..."
docker image prune -f
