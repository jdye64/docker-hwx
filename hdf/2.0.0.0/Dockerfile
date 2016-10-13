FROM centos:6.7

# Install system dependencies
RUN yum install -y unzip git vim wget tar postgresql-jdbc*

# Install HDF 2.0.0.0
RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.4.0.1/ambari.repo -O /etc/yum.repos.d/ambari.repo 

#Update the YUM repo
RUN yum update -y

RUN yum install -y ambari-server
RUN ambari-server setup --silent
RUN ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar 
RUN ambari-server install-mpack --mpack=http://public-repo-1.hortonworks.com/HDF/centos6/2.x/updates/2.0.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.0.0-579.tar.gz --purge --verbose

# Exposes the needed baseline ports
EXPOSE 8080

# Cleanup to reduce the overall size of the image
RUN yum clean all