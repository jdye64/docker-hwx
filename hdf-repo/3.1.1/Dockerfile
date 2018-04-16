FROM centos:7.2.1511
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

RUN yum install -y wget vim yum-utils createrepo epel-release nginx tar

# Fetch and download all of the HDF required repo files
RUN wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.1.0/ambari-2.6.1.0-centos7.tar.gz && wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.1.0/HDF-3.1.1.0-centos7-rpm.tar.gz && wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.22/repos/centos7/HDP-UTILS-1.1.0.22-centos7.tar.gz && wget http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDF/centos7/3.x/updates/3.1.1.0/tars/hdf_ambari_mp/hdf-ambari-mpack-3.1.1.0-35.tar.gz

# tar all of the repo files to the Nginx root serving directory.
RUN tar -xvzf /ambari-2.6.1.0-centos7.tar.gz -C /usr/share/nginx/html && tar -xvzf /HDF-3.1.1.0-centos7-rpm.tar.gz -C /usr/share/nginx/html && tar -xvzf /HDP-UTILS-1.1.0.22-centos7.tar.gz -C /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]