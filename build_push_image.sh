#!/bin/bash

# Perintah untuk membuat Docker image dari Dockerfile yang tadi dibuat, dengan nama image item-app, dan memiliki tag latest
docker build -t order-service:latest .

# Perintah untuk mengubah nama image agar sesuai dengan format GitHub Packages 
docker tag order-service:latest ghcr.io/wildanae123/a433-microservices/order-service:latest

# Perintah untuk login ke GitHub Packages via Terminal
echo $CR_PAT | docker login ghcr.io -u wildanae123 --password-stdin

# Perintah untuk mengunggah image ke GitHub Packages
docker push ghcr.io/wildanae123/a433-microservices/order-service:latest