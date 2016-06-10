echo "Creating Docker image from the master branch at https://github.com/apache/nifi this is not a formal release so please use at your own risk"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/nifi:snapshot .