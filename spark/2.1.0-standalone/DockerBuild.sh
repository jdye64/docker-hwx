echo "Creating Apache Spark 2.1.0 Standalone Image"
eval "$(docker-machine env docker-hwx)"
docker build -t jdye64/docker-hwx:spark-2.1.0-standalone .