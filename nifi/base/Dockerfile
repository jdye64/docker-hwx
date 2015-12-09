FROM ubuntu:15.10
MAINTAINER Jeremy Dyer

RUN apt-get update && apt-get install -y wget && apt-get install -y git && apt-get clean
RUN apt-get install maven -y
RUN apt-get install openjdk-8-jdk -y
RUN git clone https://github.com/apache/nifi.git && cd nifi && mvn clean install -DskipTests

# web port
EXPOSE 8080

# listen port for web listening processor
EXPOSE 8081

RUN mv /nifi/nifi-assembly/target/nifi-*-SNAPSHOT-bin/nifi-*-SNAPSHOT /nifi-latest
ENTRYPOINT ["/nifi-latest/bin/nifi.sh", "run"]
