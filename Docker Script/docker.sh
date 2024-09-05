#!/bin/bash

# Ensure Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker before running this script."
    exit 1
fi

# Function to check if Docker image is already pulled
is_docker_image_pulled() {
    local image=$1
    docker images -q "$image" | grep -q .
}

# Function to pull and run Docker container
run_docker_container() {
    local image=$1
    local port_mapping=$2
    local volume_mapping=$3
    local name=$4

    # Check if Docker image is already pulled
    if ! is_docker_image_pulled "$image"; then
        echo "Pulling Docker image $image..."
        docker pull "$image"
    else
        echo "Docker image $image is already pulled. Skipping..."
    fi

    # Construct Docker run command
    docker_run_command="docker run $port_mapping"
    if [ -n "$volume_mapping" ]; then
        docker_run_command+=" -v $volume_mapping"
    fi
    if [ -n "$name" ]; then
        docker_run_command+=" --name $name"
    fi
    docker_run_command+=" -d --rm $image"

    # Run Docker container
    echo "Running Docker container for image $image..."
    eval $docker_run_command
}

# Flowise Docker Setup
echo "Setting up Flowise..."
run_docker_container "flowiseai/flowise" "-p 3000:3000"

# Langflow Docker Setup
echo "Setting up Langflow..."
run_docker_container "langflowai/langflow" "-p 7860:7860"

# QDrant Docker Setup
echo "Setting up QDrant..."
run_docker_container "qdrant/qdrant" "-p 6333:6333 -p 6334:6334" "$(pwd)/qdrant_storage:/qdrant/storage:z"

# Unstructured API Docker Setup
echo "Setting up Unstructured API..."
run_docker_container "downloads.unstructured.io/unstructured-io/unstructured-api:latest" "-p 8000:8000" "unstructured-api"

# Neo4j Docker Setup
echo "Setting up Neo4j..."
run_docker_container "neo4j" "--publish=7474:7474 --publish=7687:7687" "$HOME/neo4j/data:/data"

echo "Docker containers are set up."
echo "Flowise is accessible at http://localhost:3000"
echo "Langflow is accessible at http://localhost:7860"
echo "QDrant is accessible at http://localhost:6333"
echo "Unstructured API is accessible at http://localhost:8000"
echo "Neo4j is accessible at http://localhost:7474"
