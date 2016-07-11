FROM java:8u91-jdk

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Apache NiFi 0.6.0
RUN wget https://archive.apache.org/dist/nifi/0.6.0/nifi-0.6.0-bin.tar.gz
RUN tar -xzvf nifi-0.6.0-bin.tar.gz
RUN rm /nifi-0.6.0-bin.tar.gz

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD nifi-0.6.0/bin/nifi.sh run