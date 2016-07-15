echo "Creating Docker HDP 2.5.0-TP2 Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/docker-hwx:hdp-250-TP2 .