# Unstructured API Docker Setup

This guide will help you set up Langflow locally using Docker. 

## Prerequisites

- Docker installed on your machine. You can download and install Docker from [here](https://www.docker.com/products/docker-desktop).

## Steps

### 1. Pull the Unstructured API Docker Image

Open your Terminal or command prompt and pull the Langflow image from Docker Hub:

```sh
docker pull downloads.unstructured.io/unstructured-io/unstructured-api:latest
```

### 2. Run Unstructured API in a Docker Container
Run the Docker container with the following command, mapping port 6333 on your host to port 6333 on the container:

```sh
docker run -p 8000:8000 -d --rm --name unstructured-api downloads.unstructured.io/unstructured-io/unstructured-api:latest

```
### 3. Access Unstructured API

Once the container is running, you can access Langflow by opening a web browser and navigating to:

### http://localhost:8000

# Note :
When you get the error server under heavy load you need to do this thing.
### WSL Configuration Guide

This guide explains how to use the `.wslconfig` file to configure the Windows Subsystem for Linux (WSL) on Windows 10 and Windows 11.

## What is .wslconfig?

The `.wslconfig` file allows you to customize various settings for WSL 2, such as memory limits, CPU limits, swap space, and localhost forwarding.

## How to Use the .wslconfig File

### 1. Create/Edit the .wslconfig File

The `.wslconfig` file should be located in your Windows user profile directory, typically `C:\Users\<YourUsername>\`.

1. Open a text editor (e.g., Notepad, Visual Studio Code).
2. Create a new file named `.wslconfig` or open the existing one located at `C:\Users\<YourUsername>\`.

### 2. Configure Settings

Add your desired configuration settings to the `.wslconfig` file. Below are some common settings:

```ini
[wsl2]
memory=8GB   # Limits VM memory size
processors=12 # Limits number of available processors
swap=8GB      # Disables the swap file
localhostForwarding=true # Enables localhost forwarding
```
At last make sure to open terminal and you should be in the same folder where the file is present and run command and restart docker
``` bash
wsl --shutdown
```