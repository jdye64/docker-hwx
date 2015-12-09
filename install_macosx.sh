echo "Setting up docker-machine for docker-hwx project"
VM_NAME="docker-hwx"
DM_CMD="docker-machine create -d virtualbox $VM_NAME"
echo "Running $DM_CMD"
$DM_CMD
echo "Setting docker-machine active environment to $VM_NAME"
eval "$(docker-machine env $VM_NAME)"
docker ps -a