FROM java:8u91-jdk

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Apache minifi 0.0.1
RUN wget http://apache.spinellicreations.com/nifi/minifi/0.0.1/minifi-0.0.1-bin.tar.gz
RUN tar -xzvf minifi-0.0.1-bin.tar.gz

# Startup NiFi
CMD /minifi-0.0.1/bin/minifi.sh run