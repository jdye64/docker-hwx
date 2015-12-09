echo "Retrives/Builds all Docker images contained within this project. This can take considerable amounts of time and network bandwidth. Beware if you are using a celluar hotspot as the downloads could be in the several GBs range!"

VM_NAME="docker-hwx"
eval "$(docker-machine env $VM_NAME)"

build_all() {
	echo "Building all docker-hwx subprojects"
	CWD=$(pwd)
	for i in $(find . -name DockerBuild.sh -print0 | xargs -0 -n1 dirname | sort --unique); do
		echo "Building File: $i"
		cd $i
		./DockerBuild.sh
		cd $CWD
		#pwd
	done
}

while true; do
    read -p "Do you really wish to build ALL of the docker images in this project?" yn
    case $yn in
        [Yy]* ) build_all; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done