echo "Setting up docker-machine for docker-hwx project"
VM_NAME="docker-hwx"
CPU_COUNT=4
DISK_SIZE_MB=80000
MEM_MB=8024
DM_CMD="docker-machine create -d virtualbox --virtualbox-disk-size $DISK_SIZE_MB --virtualbox-memory $MEM_MB --virtualbox-cpu-count $CPU_COUNT $VM_NAME"
echo "Running $DM_CMD"
$DM_CMD
echo "Setting docker-machine active environment to $VM_NAME"
eval "$(docker-machine env $VM_NAME)"
docker ps -a