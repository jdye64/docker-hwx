echo "Creating Apache Spark 1.6.3 Standalone Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/docker-hwx:spark-1.6.3-standalone .