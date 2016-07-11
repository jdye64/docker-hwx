FROM java:8u91-jdk

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Apache NiFi 0.6.1
RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/1.1.0.0/nifi-1.1.0.0-10-bin.zip
RUN unzip nifi-1.1.0.0-10-bin.zip
RUN rm nifi-1.1.0.0-10-bin.zip

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD /nifi-1.1.0.0-10/bin/nifi.sh run