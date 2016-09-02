#!/bin/bash
SLEEP_SEC="30"
NIFI_PORT="8080"
NIFI_IMAGE_NAME="jdye64/docker-hwx:nifi-facedetectiondemo"

# Checks for an instance of $NIFI_IMAGE_NAME already running
CONTAINER_ID=$(docker ps | grep $NIFI_IMAGE_NAME | awk '{ print $1 }')
if [ -n "$CONTAINER_ID" ]; then
	echo "There is already an instance of $NIFI_IMAGE_NAME running as container $CONTAINER_ID"
	while true; do
    	read -p "Would you like to kill the already running $NIFI_IMAGE_NAME container?" yn
    	case $yn in
        	[Yy]* ) echo "killing Docker container $CONTAINER_ID"; docker kill $CONTAINER_ID; break;;
        	[Nn]* ) exit;;
        	* ) echo "Please answer yes or no.";;
    	esac
	done
fi

echo "Launching latest NiFi instance"
CONTAINER_ID=$(docker run -t -d -p 9393:9393 -p 8888:8888 -p 9292:9292 $NIFI_IMAGE_NAME)

NIFI_URL="http://127.0.0.1:9292/nifi"
echo "Opening NiFi WebUI at $NIFI_URL"
echo "Sleeping for $SLEEP_SEC seconds before opening browser to give NiFi time to launch WebUI"
sleep $SLEEP_SEC
open $NIFI_URL
