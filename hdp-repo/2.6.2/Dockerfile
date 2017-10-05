FROM centos:7.2.1511
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

RUN yum install -y wget vim yum-utils createrepo epel-release nginx

# Fetch the Hortonworks Repo files
RUN wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.2.0/ambari.repo -O /etc/yum.repos.d/ambari.repo && wget -nv http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.6.2.0/hdp.repo -O /etc/yum.repos.d/hdp.repo

# Make the appropriate Nginx directories and sync the repos
RUN mkdir -p /usr/share/nginx/html/ambari/centos7 && cd /usr/share/nginx/html/ambari/centos7 && reposync -r ambari-2.5.2.0

# Install the HDP repo
RUN mkdir -p /usr/share/nginx/html/hdp/centos7 && cd /usr/share/nginx/html/hdp/centos7 && reposync -r HDP-2.6.2.0

# Install the HDP-UTILS repo
RUN mkdir -p /usr/share/nginx/html/hdp-utils/centos7 && cd /usr/share/nginx/html/hdp-utils/centos7 && reposync -r HDP-UTILS-1.1.0.21

# Create the repos metadata
RUN createrepo /usr/share/nginx/html/ambari/centos7/ambari-2.5.2.0 && createrepo /usr/share/nginx/html/hdp/centos7/HDP-2.6.2.0 && createrepo /usr/share/nginx/html/hdp-utils/centos7/HDP-UTILS-1.1.0.21

RUN yum install -y yum-plugin-priorities

CMD ["nginx", "-g", "daemon off;"]