echo "Creating Docker HDP 2.5.0-TP1 Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/hdp:250-TP1 .