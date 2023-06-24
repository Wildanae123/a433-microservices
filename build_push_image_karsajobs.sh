#!/bin/bash

# Script untuk Build dan Push Docker Image untuk backend

# Perintah untuk build Docker image dari berkas Dockerfile yang disediakan untuk backend
docker build -t karsajobs:latest .

# Perintah login ke GitHub Packages via Terminal
echo $CR_PAT | docker login ghcr.io -u wildanae123 --password-stdin

# Perintah untuk mengubah nama image agar sesuai dengan format GitHub Packages
docker tag karsajobs:latest ghcr.io/wildanae123/a433-microservices/karsajobs:latest

# Perintah mengunggah image ke GitHub Packages
docker push ghcr.io/wildanae123/a433-microservices/karsajobs:latest