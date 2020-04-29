FROM centos:7.2.1511
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

ARG AMBARI_REPO_URL

RUN yum install -y wget
RUN wget -nv ${AMBARI_REPO_URL} -O /etc/yum.repos.d/ambari.repo && yum install -y sudo \
	net-tools \
	ambari-server \
	postgresql-jdbc 

RUN ambari-server setup --database=postgres --databasehost=postgres.dev --databaseport=5432 --databasename=ambari --postgresschema=ambari  --databaseusername=ambari --databasepassword=dev --silent \
	&& ambari-server setup --jdbc-db postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar

ADD scripts/start.sh /start.sh
EXPOSE 8080:8080
CMD /start.sh
