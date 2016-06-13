FROM java:8u91-jdk

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Install Maven
ADD apache-maven-3.3.9-bin.tar.gz /
RUN cp -R apache-maven-3.3.9 /usr/local
RUN ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

# Install Apache NiFi 0.6.1
RUN wget http://www.trieuvan.com/apache/nifi/0.6.1/nifi-0.6.1-bin.tar.gz && tar -xzvf nifi-0.6.1-bin.tar.gz

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD nifi-0.6.1/bin/nifi.sh run