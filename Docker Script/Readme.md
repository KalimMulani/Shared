# Docker Setup Scripts

This repository contains two scripts: one for PowerShell (Windows) and one for Bash (macOS). Both scripts automate the setup of several Docker containers for different applications, including Flowise, Langflow, QDrant, Unstructured API, and Neo4j. 

## Prerequisites

- **Docker**: Ensure Docker is installed and running on your machine. You can download Docker from [Docker's official website](https://www.docker.com/get-started).

## Overview

Both scripts perform the following tasks:
1. Check if Docker is installed.
2. Pull the necessary Docker images if they are not already available.
3. Run Docker containers for each specified application.
4. Output the access URLs for the running applications.

## Setup Instructions

### For PowerShell (Windows)

1. **Clone or Download the Script**: 
   - Clone the repository or download the PowerShell script file (`setup-docker-windows.ps1`) to your local machine.

2. **Open PowerShell**:
   - Run PowerShell as an administrator.

3. **Execute the Script**:
   - Navigate to the directory where the script is located and execute the script by running:
     ```powershell
     .\docker.ps1
     ```

### For Bash (macOS)

1. **Clone or Download the Script**: 
   - Clone the repository or download the Bash script file (`setup-docker-macos.sh`) to your local machine.

2. **Open Terminal**:
   - Open the Terminal application on your macOS.

3. **Make the Script Executable** (if necessary):
   - Navigate to the directory where the script is located and run:
     ```bash
     chmod +x docker.sh
     ```

4. **Execute the Script**:
   - Run the script by executing:
     ```bash
     ./docker.sh
     ```

## Applications Deployed

- **Flowise**
  - Image: `flowiseai/flowise`
  - Port: `3000`
  - Access URL: [http://localhost:3000](http://localhost:3000)

- **Langflow**
  - Image: `langflowai/langflow`
  - Port: `7860`
  - Access URL: [http://localhost:7860](http://localhost:7860)

- **QDrant**
  - Image: `qdrant/qdrant`
  - Ports: `6333` (HTTP), `6334` (gRPC)
  - Access URL: [http://localhost:6333](http://localhost:6333)

- **Unstructured API**
  - Image: `downloads.unstructured.io/unstructured-io/unstructured-api:latest`
  - Port: `8000`
  - Access URL: [http://localhost:8000](http://localhost:8000)

- **Neo4j**
  - Image: `neo4j`
  - Ports: `7474` (HTTP), `7687` (Bolt)
  - Access URL: [http://localhost:7474](http://localhost:7474)

## Notes

- Ensure that you have the necessary permissions to run Docker and access the specified ports.
- Make sure to check the logs if any container fails to start, as there may be errors related to port conflicts or missing configurations.
- You can customize the volume mappings and container names in the scripts as needed.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

## Author

[Kalim Mulani](https://github.com/KalimMulani)  
