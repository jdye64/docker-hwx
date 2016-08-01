FROM java:8u91-jdk

ENV NIFI_VERSION=0.6.1
ENV NIFI_HOME=/nifi-$NIFI_VERSION
ENV TESSDATA_PREFIX /usr/share/tesseract-ocr/tessdata

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Maven
ADD apache-maven-3.3.9-bin.tar.gz /
RUN cp -R apache-maven-3.3.9 /usr/local
RUN ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

# Install Apache NiFi 0.6.1
RUN wget https://archive.apache.org/dist/nifi/0.6.1/nifi-0.6.1-bin.tar.gz && tar -xzvf nifi-0.6.1-bin.tar.gz
RUN rm /nifi-0.6.1-bin.tar.gz

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD $NIFI_HOME/bin/nifi.sh run