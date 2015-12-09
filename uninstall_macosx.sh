echo "Uninstalling all Docker containers and docker-hwx VirtualBox VM"

while true; do
    read -p "Do you really wish to delete all previously built Docker containers for the docker-hwx VM?" yn
    case $yn in
        [Yy]* ) docker-machine kill docker-hwx; docker-machine rm docker-hwx; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done