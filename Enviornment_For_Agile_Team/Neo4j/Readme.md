# Neo4j Docker Setup

This guide will help you set up Langflow locally using Docker. 

## Prerequisites

- Docker installed on your machine. You can download and install Docker from [here](https://www.docker.com/products/docker-desktop).

## Steps

### 1. Pull the Neo4j Docker Image

Open your terminal or command prompt and pull the Langflow image from Docker Hub:

```sh
docker pull neo4j
```

### 2. Run Neo4j in a Docker Container with apoc
Run the Docker container with the following command, mapping port 7474 on your host to port 7474 on the container: (Run the command in git bash)

```sh
docker run \
    -p 7474:7474 -p 7687:7687 \
    -v $PWD/data:/data -v $PWD/plugins:/plugins \
    --name neo4j-apoc \
    -e NEO4J_apoc_export_file_enabled=true \
    -e NEO4J_apoc_import_file_enabled=true \
    -e NEO4J_apoc_import_file_use__neo4j__config=true \
    -e NEO4J_PLUGINS='["apoc", "graph-data-science"]' \
    neo4j
    
```
### 3. Access Neo4j

Once the container is running, you can access Langflow by opening a web browser and navigating to:

### http://localhost:7474