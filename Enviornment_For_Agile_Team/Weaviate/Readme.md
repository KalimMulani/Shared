# Weaviate Docker Hub Image

The default docker image doesn't need any configuration. To run a basic Weaviate instance, run this command from a terminal:
```bash
 docker run -p 8080:8080 -p 50051:50051 cr.weaviate.io/semitechnologies/weaviate:1.24.20

```
## Usage

### Sample Docker Compose file
We prepared a starter Docker Compose file, which will let you:
Run vector searches with Cohere, HuggingFace, OpenAI, and Google modules.
Search already vectorized data – no vectorizer required.
Retrieval augmented generation (RAG) with OpenAI (i.e. gpt-4), Cohere, Google modules.
Download and run

Save the text below as docker-compose.yml:
 ```bash
 ---
version: '3.4'
services:
  weaviate:
    command:
    - --host
    - 0.0.0.0
    - --port
    - '8080'
    - --scheme
    - http
    image: cr.weaviate.io/semitechnologies/weaviate:1.25.4
    ports:
    - 8080:8080
    - 50051:50051
    volumes:
    - weaviate_data:/var/lib/weaviate
    restart: on-failure:0
    environment:
      QUERY_DEFAULTS_LIMIT: 25
      AUTHENTICATION_ANONYMOUS_ACCESS_ENABLED: 'true'
      PERSISTENCE_DATA_PATH: '/var/lib/weaviate'
      DEFAULT_VECTORIZER_MODULE: 'none'
      ENABLE_MODULES: 'text2vec-cohere,text2vec-huggingface,text2vec-palm,text2vec-openai,generative-openai,generative-cohere,generative-palm,ref2vec-centroid,reranker-cohere,qna-openai,text2vec-ollama,generative-ollama'
      CLUSTER_HOSTNAME: 'node1'
volumes:
  weaviate_data:
...
```

Edit the docker-compose.yml file to add your local configuration. To start your Weaviate instance, run this command in your shell:

```bash
docker compose up -d
```