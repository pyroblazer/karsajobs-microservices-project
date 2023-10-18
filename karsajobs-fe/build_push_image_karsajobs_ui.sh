#!/bin/bash

# Initialize variables for GitHub username and repository
GITHUB_USERNAME=pyroblazer
GITHUB_REGISTRY=ghcr.io  # GitHub Container Registry URL

# Construct the image name in the appropriate format for GitHub Packages
IMAGE_NAME=$GITHUB_REGISTRY/$GITHUB_USERNAME/karsajobs-ui:latest

# Command to build a Docker image from Dockerfile
docker build -t $IMAGE_NAME .

# View the list of images locally
docker images

# Login to GitHub Packages using a personal access token (PAT)
echo $GITHUB_TOKEN | docker login $GITHUB_REGISTRY -u $GITHUB_USERNAME --password-stdin

# Upload the image to GitHub Packages
docker push $IMAGE_NAME

# Cleanup: remove the local image
docker rmi $IMAGE_NAME