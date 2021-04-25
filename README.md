# Substrate node

Easy to run substrate node using docker. It provides both substrate-node-template and substrate-front-end-template for development

# How to run

1. Install [docker](https://docs.docker.com/engine/install/) & [docker-composer](https://docs.docker.com/compose/install/)
2. Download source code & run

```
$ git clone https://github.com/hawkingnetwork/substrate-node-template-docker.git substrate
$ cd substrate
$ docker-composer -up -d
```

3. Open browser and enter url to access substrate front end:

- `http://localhost:8000` if you run on your computer
- `http://serverip:8000` if you run on your server
- Note: if you wanna run on your server, please replace your `server's ip` in line (https://github.com/hawkingnetwork/substrate-node-template-docker/blob/master/docker-compose.yml#L39) `- PROVIDER_SOCKET=ws://127.0.0.1:9944`

# References

To get more information please refer these links

1. [Substrate node template](https://github.com/substrate-developer-hub/substrate-node-template)
2. [Substrate front-end template](https://github.com/substrate-developer-hub/substrate-front-end-template)
