echo "Creating Apache NiFi 0.5.0 Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/docker-hwx:nifi-0.5.0 .