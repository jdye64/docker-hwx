FROM centos:6.7
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

RUN yum install -y wget vim yum-utils createrepo epel-release nginx tar

# Fetch and download all of the HDF required repo files
RUN wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.4.1.0/ambari-2.4.1.0-centos6.tar.gz && wget http://public-repo-1.hortonworks.com.s3.amazonaws.com/HDF/centos6/2.x/updates/2.0.1.0/HDF-2.0.1.0-centos6-rpm.tar.gz && wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.21/repos/centos6/HDP-UTILS-1.1.0.21-centos6.tar.gz && wget http://public-repo-1.hortonworks.com/HDF/centos6/2.x/updates/2.0.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.1.0-12.tar.gz

# tar all of the repo files to the Nginx root serving directory.
RUN tar -xvzf /ambari-2.4.1.0-centos6.tar.gz -C /usr/share/nginx/html && tar -xvzf /HDF-2.0.1.0-centos6-rpm.tar.gz -C /usr/share/nginx/html && tar -xvzf /HDP-UTILS-1.1.0.21-centos6.tar.gz -C /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]