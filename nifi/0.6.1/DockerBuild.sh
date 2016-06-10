echo "Creating Apache NiFi 0.6.1 Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/nifi:0.6.1 .