FROM java:8u91-jdk

ENV NIFI_HOME /nifi-0.7.0

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Apache NiFi 0.7.0
RUN wget http://mirrors.koehn.com/apache/nifi/0.7.0/nifi-0.7.0-bin.tar.gz && tar -xzvf nifi-0.7.0-bin.tar.gz
RUN rm /nifi-0.7.0-bin.tar.gz

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD nifi-0.7.0/bin/nifi.sh run