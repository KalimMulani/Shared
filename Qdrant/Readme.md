# QDrant Docker Setup

This guide will help you set up Langflow locally using Docker. 

## Prerequisites

- Docker installed on your machine. You can download and install Docker from [here](https://www.docker.com/products/docker-desktop).

## Steps

### 1. Pull the QDrant Docker Image

Open your git bash and pull the Langflow image from Docker Hub:

```sh
docker pull qdrant/qdrant
```

### 2. Run QDrant in a Docker Container
Run the Docker container with the following command, mapping port 6333 on your host to port 6333 on the container:

```sh
docker run -p 6333:6333 -p 6334:6334 \
    -v $(pwd)/qdrant_storage:/qdrant/storage:z \
    qdrant/qdrant

```
### 3. Access QDrant

Once the container is running, you can access Langflow by opening a web browser and navigating to:

### http://localhost:7860/dashboard