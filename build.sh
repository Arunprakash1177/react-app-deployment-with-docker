#!/bin/bash

# Stop old container
docker stop react || true
docker rm react || true

# Build image
docker build -t react-ci-cd .

# Run container
docker run -d --name react -p 5020:80 react-ci-cd

# Tag for Docker Hub
docker tag react-ci-cd arunprakash1177/react-app:ci-cd

# Push to Docker Hub
docker push arunprakash1177/react-app:ci-cd
