FROM centos:7.2.1511

# Update apt-get repository
RUN yum update -y

# Install system dependencies
RUN yum install -y unzip git vim wget

# Install HDF 2.0.0.0
RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.4.0.1/ambari.repo -O /etc/yum.repos.d/ambari.repo && yum update && yum install -y ambari-server && ambari-server setup --silent && RUN ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar

# Exposes the needed baseline ports
EXPOSE 8080