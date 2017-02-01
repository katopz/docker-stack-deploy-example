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
. swarm-cluster.sh
```

### Creating Swarm Services Through Docker Stack Commands.
```shell
# Creating network
. setup-stack.sh
```

### Cleanup
```shell
docker-machine rm -f node-1 node-2 node-3
```