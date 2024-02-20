#!/bin/bash

# Stop all running containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)

# Remove all Docker images
docker rmi -f $(docker images -aq)

# Remove all volumes (Warning: This will delete all your data in the volumes)
docker volume rm $(docker volume ls -q)

# Clean up the system: unused containers, networks, images (both dangling and unreferenced), and volumes.
docker system prune -a --volumes

# If you are using Docker Compose, uncomment the following line to rebuild and start the services
# docker-compose up --build
