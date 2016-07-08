echo "Creating Docker HDP 2.4.0 Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/hdp240 .