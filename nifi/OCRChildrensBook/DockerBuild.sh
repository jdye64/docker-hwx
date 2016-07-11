echo "Creating NiFi OCRChildrensBook"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/docker-hwx:nifi-ocrchildrensbook .