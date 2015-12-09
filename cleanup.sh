VM_NAME="docker-hwx"
eval "$(docker-machine env $VM_NAME)"
docker rm -v $(docker ps -a -q -f status=exited)