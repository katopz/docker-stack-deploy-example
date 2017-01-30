# Creating network
docker-machine ssh node-1 "docker network create --driver overlay proxy"

# Grab the source.
docker-machine ssh node-1 "curl -o docker-compose-stack.yml https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/docker-compose-stack.yml"

# Create docker-flow-proxy and docker-flow-swarm-listener services.
docker-machine ssh node-1 "docker stack deploy -c docker-compose-stack.yml proxy"

# Deploying More Stacks
docker-machine ssh node-1 "curl -o docker-compose-go-demo.yml https://raw.githubusercontent.com/vfarcic/go-demo/master/docker-compose-stack.yml"

# Deploy.
docker-machine ssh node-1 "docker stack deploy -c docker-compose-go-demo.yml go-demo"

# Verify from internal.
docker-machine ssh node-1 "docker stack ps go-demo"

# Wait for 3 sec to let server start properly.
echo "Will wait for 3 seconds..."
sleep 3

# Verify from external.
docker-machine ssh node-1 'curl -i "127.0.0.1/demo/hello"'
