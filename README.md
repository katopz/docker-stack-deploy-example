### Source
 - https://technologyconversations.com/2017/01/23/using-docker-stack-and-compose-yaml-files-to-deploy-swarm-services/

### Prerequisites
- Docker 1.13
- Docker Compose 1.10
- Docker Machine 0.9
- [Docker Toolbox](https://www.docker.com/products/docker-toolbox)

### Upstream
```shell
curl -o swarm-cluster.sh https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/scripts/swarm-cluster.sh
```

### Swarm Cluster Setup
```shell
# Will create 3 nodes, taking sometime.
. ./swarm-cluster.sh

# Getting in node-1
docker-machine ssh node-1
```

### Creating Swarm Services Through Docker Stack Commands.
```shell
# Creating network
docker network create --driver overlay proxy

# Grab the source.
curl -o docker-compose-stack.yml https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/docker-compose-stack.yml

# Create docker-flow-proxy and docker-flow-swarm-listener services.
docker stack deploy -c docker-compose-stack.yml proxy
```

### Deploying More Stacks
```shell
# Grab the source.
curl -o docker-compose-go-demo.yml https://raw.githubusercontent.com/vfarcic/go-demo/master/docker-compose-stack.yml

# Deploy.
docker stack deploy -c docker-compose-go-demo.yml go-demo

# Verify from internal.
docker stack ps go-demo

# Verify from external.
curl -i "127.0.0.1/demo/hello"
```

### Cleanup
```shell
exit 
docker-machine rm -f node-1 node-2 node-3
```