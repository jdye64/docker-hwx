echo "Creating Docker HDP 2.3.2 Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/hdp232 .