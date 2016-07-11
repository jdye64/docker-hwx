FROM java:8u91-jdk

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Apache NiFi 0.6.1
RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/centos6/1.x/updates/1.2.0.1/HDF-1.2.0.1-1.zip
RUN unzip HDF-1.2.0.1-1.zip
RUN rm HDF-1.2.0.1-1.zip

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD /HDF-1.2.0.0/nifi/bin/nifi.sh run