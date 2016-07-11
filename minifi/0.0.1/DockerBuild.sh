echo "Creating Apache miNiFi 0.0.1 Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/docker-hwx:minifi-0.0.1 .