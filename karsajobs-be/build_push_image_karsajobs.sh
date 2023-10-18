#!/bin/bash

# Initializing GitHub username and repository variables
GITHUB_USERNAME=pyroblazer
GITHUB_REGISTRY=ghcr.io  # GitHub Container Registry URL

# Constructing the image name in the appropriate format for GitHub Packages
IMAGE_NAME=$GITHUB_REGISTRY/$GITHUB_USERNAME/karsajobs:latest

# Command to build a Docker image from Dockerfile
docker build -t $IMAGE_NAME .

# View the list of images locally
docker images

# Login to GitHub Packages using the Personal Access Token (PAT)
echo $GITHUB_TOKEN | docker login $GITHUB_REGISTRY -u $GITHUB_USERNAME --password-stdin

# Push the image to GitHub Packages
docker push $IMAGE_NAME

# Cleanup: Remove the local image
docker rmi $IMAGE_NAME