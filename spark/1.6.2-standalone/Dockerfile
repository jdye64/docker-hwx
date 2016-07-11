FROM java:8u91-jdk

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git vim

# Download and extract Apache Spark 1.6.2 without Hadoop
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.2-bin-hadoop2.6.tgz
RUN tar -xzvf spark-1.6.2-bin-hadoop2.6.tgz
RUN rm /spark-1.6.2-bin-hadoop2.6.tgz