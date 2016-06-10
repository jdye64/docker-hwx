FROM java:8u91-jdk
MAINTAINER Jeremy Dyer

RUN apt-get update && apt-get install -y git

# Install Maven
ADD apache-maven-3.3.9-bin.tar.gz /
RUN cp -R apache-maven-3.3.9 /usr/local
RUN ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

RUN git clone https://github.com/apache/nifi.git && cd nifi && mvn clean install -DskipTests

# web port
EXPOSE 8080

# listen port for web listening processor
EXPOSE 8081

RUN mv /nifi/nifi-assembly/target/nifi-*-SNAPSHOT-bin/nifi-*-SNAPSHOT /nifi-latest
CMD /nifi-latest/bin/nifi.sh run