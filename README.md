# docker-hwx

The goal of this project is to serve as a repository of examples, quick start guides, and even more detailed examples related to either Hortonworks(hwx) projects or other closely tied components in the Hadoop open source ecosystem.

The branching strategy will revolve around the offical Hortonworks HDP version (starting with HDP 2.3). Therefore all Docker containers with a specific branch should work with the correlating HDP version as specified by the GitHug branch.

All materials are expected to be ran on Mac OS X machines and users are expected to have already downloaded and installed the Docker-Toolbox https://www.docker.com/docker-toolbox

# QuickStart
```
install_macosx.sh && build_all_images.sh
```
Then run the appropriate "DockerRun.sh" script for whichever sub project you would like to deploy.

# Installation

Before building any Docker containers you must first run "install_macosx.sh" which will install the appropriate virtualbox Docker environment for this 

The real power gained by using this project and Docker is the ability to quickly spin up and show examples/demos. Therefore the best approach would be to build all of your Docker images upfront so they are ready to run at a moments notice. There is a script "build_all_images.sh" that will do just that. This script will build all of the child sub projects and prepare the images for running. Each sub project contains a "DockerBuild.sh" and "DockerRun.sh" file. If you will to run only a single example/demo and not build all of the projects you can do so by running something like 
```
"$DOCKER-HWX-HOME/nifi/snapshot/DockerBuild.sh && $DOCKER-HWX-HOME/nifi/snapshot/DockerRun.sh"
```

# Contributing

Please fork, create a new branch, and open a pull request to contribute anything to this project.