# Just for perf, you can skip this.
START_SEC=$(date +'%s')

# Creating network.
docker-machine ssh node-1 "docker network create --driver overlay proxy"

# Grab the source.
docker-machine ssh node-1 "curl -o docker-compose-stack.yml https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/docker-compose-stack.yml"

# Create docker-flow-proxy and docker-flow-swarm-listener services.
docker-machine ssh node-1 "docker stack deploy -c docker-compose-stack.yml proxy"

# Deploying More Stacks.
docker-machine ssh node-1 "curl -o docker-compose-go-demo.yml https://raw.githubusercontent.com/vfarcic/go-demo/master/docker-compose-stack.yml"

# Deploy.
docker-machine ssh node-1 "docker stack deploy -c docker-compose-go-demo.yml go-demo"

# See tasks of the stack.
docker-machine ssh node-1 "docker stack ps proxy"

# Verify from internal.
docker-machine ssh node-1 "docker stack ps go-demo"

# See how long does it take.
echo "Done in $(($(date +'%s') - $START_SEC)) seconds"

# Wait for 10 sec to let server start properly.
echo "Will wait for 10 seconds..."
sleep 10

# Verify from external.
docker-machine ssh node-1 'curl -i "127.0.0.1/demo/hello"'

# Hm?
echo "If curl don't work do wait a minite and try curl again."
