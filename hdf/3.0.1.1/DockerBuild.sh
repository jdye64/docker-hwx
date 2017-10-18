#!/bin/bash

echo "Creating HDF 3.0.1.1 Image" 
cd ./base && ./DockerBuild.sh
cd ../
cd ./server && ./DockerBuild.sh
cd ../
cd ./agent && ./DockerBuild.sh
cd ../