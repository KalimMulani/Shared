# Quick Start

This example covers the most basic use-case - collection creation and basic vector search.
For additional information please refer to the [API documentation](https://api.qdrant.tech/).

## Docker 🐳

Use latest pre-built image from [DockerHub](https://hub.docker.com/r/qdrant/qdrant)

```bash
docker pull qdrant/qdrant
```

Run it with default configuration:

```bash
docker run -p 6333:6333 qdrant/qdrant
```

Build your own from source

```bash
docker build . --tag=qdrant/qdrant
```

And once you need a fine-grained setup, you can also define a storage path and custom configuration:

```bash
docker run -p 6333:6333 \
    -v $(pwd)/path/to/data:/qdrant/storage \
    -v $(pwd)/path/to/snapshots:/qdrant/snapshots \
    -v $(pwd)/path/to/custom_config.yaml:/qdrant/config/production.yaml \
    qdrant/qdrant
```

- `/qdrant/storage` - is the place where Qdrant persists all your data.
  Make sure to mount it as a volume, otherwise docker will drop it with the container.
- `/qdrant/snapshots` - is the place where Qdrant stores [snapshots](https://qdrant.tech/documentation/concepts/snapshots/)
- `/qdrant/config/production.yaml` - is the file with engine configuration. You can override any value from the [reference config](https://github.com/qdrant/qdrant/blob/master/config/config.yaml). In a real production environment, you should enable authentication by setting `service.apiKey`.
- For production environments, consider also setting [`--read-only`](https://docs.docker.com/reference/cli/docker/container/run/#read-only) and `--user=1000:2000` to further secure your Qdrant instance. Or use [our Helm chart](https://github.com/qdrant/qdrant-helm) or [Qdrant Cloud](https://qdrant.tech/documentation/cloud/) which sets these by default.

Now Qdrant should be accessible at [localhost:6333](http://localhost:6333/).