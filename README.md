## Commands to pull the Langflow container

```bash
docker pull langflowai/langflow
```
```bash
docker run -it --rm -p 7860:7860 langflowai/langflow:latest
```

## Commands to pull the Supabase container

```bash
# Get the code
git clone --depth 1 https://github.com/supabase/supabase

# Go to the docker folder
cd supabase/docker

# Copy the fake env vars
cp .env.example .env

# Pull the latest images
docker compose pull

# Start the services (in detached mode)
docker compose up -d
```
## Commands to get the Flowwise container

Open the Shared folder path in the terminal and run the following command

```bash
docker-compose up -d
```
After the container starts running go to localhost:3000 you will find flowwise running.
Then go to the setting a top right corner and upload the Chatbot Chatflow file provided to create a simple chatbot ans save and test it if it is working.