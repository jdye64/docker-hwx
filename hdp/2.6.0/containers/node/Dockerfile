FROM centos:7.2.1511
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

ARG AMBARI_REPO_URL
ARG HDP_REPO_URL
RUN yum install -y sudo wget openssl-devel postgresql-jdbc mysql-connector-java unzip
RUN wget -nv ${AMBARI_REPO_URL} -O /etc/yum.repos.d/ambari.repo
RUN wget -nv ${HDP_REPO_URL} -O /etc/yum.repos.d/hdp.repo

# Uncomment if you want to run kerberos in container
#RUN yum install -y krb5-server krb5-libs krb5-workstation
RUN yum install -y ambari-agent \
	ambari-metrics=* \
	ambari-logsearch-* \
	hadoop* \
	zookeeper \
	hive* \
	phoenix_* \
	ranger* \
	storm_* \
	kafka_* \
	pig_* \
	datafu_* \
	spark* \
	livy* \
	zeppelin* \
	falcon_* \
	oozie_* \
	lzo \
	snappy-devel \
	rpcbind

# Remove hdp repo and clean up the yum cache to trim some size down.
RUN rm /etc/yum.repos.d/hdp*.repo && yum clean all
ADD scripts/start.sh /start.sh

# Master Servies
EXPOSE 2181 8020 9000 50090 8088 8050 8025 8030 8141 45454 10200 8188 8190 19888 10000 9999 9933 10015 16000 16010 8000 8744 11000 11443 8443 6080 6182 6083 6183 3000 9995

# Worker Services
EXPOSE 50070 50470 50075 50475 50010 50020 50030 16020 16030 45454 8042 8983 6667

CMD /start.sh
