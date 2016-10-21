#!/bin/bash

echo "Creating HDF 2.0.0.0 Image" 
cd ./base && ./DockerBuild.sh
cd ../
cd ./server && ./DockerBuild.sh
cd ../
cd ./agent && ./DockerBuild.sh
cd ../