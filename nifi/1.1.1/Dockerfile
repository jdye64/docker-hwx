FROM java:8u91-jdk

ENV NIFI_VERSION=1.1.1
ENV NIFI_HOME=/nifi-$NIFI_VERSION

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Apache NiFi 1.1.1
RUN wget https://archive.apache.org/dist/nifi/1.1.1/nifi-1.1.1-bin.tar.gz && tar -xvzf nifi-1.1.1-bin.tar.gz
RUN rm /nifi-1.1.1-bin.tar.gz

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD $NIFI_HOME/bin/nifi.sh run