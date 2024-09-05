# Ensure Docker is installed
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker is not installed. Please install Docker before running this script."
    exit
}

# Temporarily change the execution policy to allow the script to run
$previousExecutionPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Function to check if Docker image is already pulled
function Is-DockerImagePulled {
    param (
        [string]$image
    )
    $result = docker images -q $image
    return -not [string]::IsNullOrEmpty($result)
}

# Function to pull and run Docker container
function Run-DockerContainer {
    param (
        [string]$image,
        [string]$portMapping,
        [string]$volumeMapping = "",
        [string]$name = ""
    )
    
    # Check if Docker image is already pulled
    if (-not (Is-DockerImagePulled -image $image)) {
        Write-Host "Pulling Docker image $image..."
        docker pull $image
    } else {
        Write-Host "Docker image $image is already pulled. Skipping..."
    }

    # Construct Docker run command
    $dockerRunCommand = "docker run $portMapping"
    if ($volumeMapping) {
        $dockerRunCommand += " -v $volumeMapping"
    }
    if ($name) {
        $dockerRunCommand += " --name $name"
    }
    $dockerRunCommand += " -d --rm $image"

    # Run Docker container
    Write-Host "Running Docker container for image $image..."
    Invoke-Expression $dockerRunCommand
}

# Flowise Docker Setup
Write-Host "Setting up Flowise..."
Run-DockerContainer -image "flowiseai/flowise" -portMapping "-p 3000:3000"

# Langflow Docker Setup
Write-Host "Setting up Langflow..."
Run-DockerContainer -image "langflowai/langflow" -portMapping "-p 7860:7860"

# QDrant Docker Setup
Write-Host "Setting up QDrant..."
Run-DockerContainer -image "qdrant/qdrant" -portMapping "-p 6333:6333 -p 6334:6334" -volumeMapping "$(pwd)/qdrant_storage:/qdrant/storage:z"

# Unstructured API Docker Setup
Write-Host "Setting up Unstructured API..."
Run-DockerContainer -image "downloads.unstructured.io/unstructured-io/unstructured-api:latest" -portMapping "-p 8000:8000" -name "unstructured-api"

# Neo4j Docker Setup
Write-Host "Setting up Neo4j..."
Run-DockerContainer -image "neo4j" -portMapping "--publish=7474:7474 --publish=7687:7687" -volumeMapping "$HOME/neo4j/data:/data"

Write-Host "Docker containers are set up."
Write-Host "Flowise is accessible at http://localhost:3000"
Write-Host "Langflow is accessible at http://localhost:7860"
Write-Host "QDrant is accessible at http://localhost:6333"
Write-Host "Unstructured API is accessible at http://localhost:8000"
Write-Host "Neo4j is accessible at http://localhost:7474"

# Restore the previous execution policy
Set-ExecutionPolicy -ExecutionPolicy $previousExecutionPolicy -Scope Process -Force
