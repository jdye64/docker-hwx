echo "Creating NiFi FaceDetectionDemo"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/nifi:facedetectiondemo .