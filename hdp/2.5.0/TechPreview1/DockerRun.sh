#!/bin/bash
SLEEP_SEC="30"
HDP_IMAGE_NAME="jdye64/hdp:250-TP1"
eval "$(docker-machine env docker-hwx)"

DOCKER_MACHINE_NAME=env | grep docker | grep DOCKER_MACHINE_NAME | cut -f2 -d'='
echo "Current Docker Machine '$DOCKER_MACHINE_NAME'"

# Checks for an instance of $NIFI_IMAGE_NAME already running
CONTAINER_ID=$(docker ps | grep nifi-latest | awk '{ print $1 }')
if [ -n "$CONTAINER_ID" ]; then
	echo "There is already an instance of $HDP_IMAGE_NAME running as container $CONTAINER_ID"
	while true; do
    	read -p "Would you like to kill the already running $HDP_IMAGE_NAME container?" yn
    	case $yn in
        	[Yy]* ) echo "killing Docker container $CONTAINER_ID"; docker kill $CONTAINER_ID; break;;
        	[Nn]* ) exit;;
        	* ) echo "Please answer yes or no.";;
    	esac
	done
fi

echo "Launching latest $HDP_IMAGE_NAME instance"
CONTAINER_ID=$(docker run -t -d -P -h docker.dev $HDP_IMAGE_NAME)

IP_ADDR=$(docker-machine inspect $DOCKER_MACHINE_NAME | grep IPAddress | cut -f2 -d':' | cut -f2 -d'"')
echo "IPAddress: $IP_ADDR"
AMBARI_PORT=$(docker ps | grep $HDP_IMAGE_NAME | tr "," "\n" | grep 8080/tcp | cut -f2 -d ':' | cut -f1 -d '-')
AMBARI_URL="http://$IP_ADDR:$AMBARI_PORT"
echo "Opening $HDP_IMAGE_NAME WebUI at $AMBARI_URL"
echo "Sleeping for $SLEEP_SEC seconds before opening browser to give $HDP_IMAGE_NAME time to launch WebUI"
sleep $SLEEP_SEC
open $AMBARI_URL
