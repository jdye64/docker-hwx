FROM jdye64/docker-hwx:hdf-2.0.0.0-base
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

# Install and prep Ambari Server
RUN yum install -y ambari-server && ambari-server setup --silent && ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar && ambari-server install-mpack --mpack=http://public-repo-1.hortonworks.com/HDF/centos6/2.x/updates/2.0.0.0/tars/hdf_ambari_mp/hdf-ambari-mpack-2.0.0.0-579.tar.gz --purge --verbose

RUN yum install -y ambari-agent && ambari-agent start

# Setup networking
ADD scripts /scripts
RUN cp /scripts/public-hostname.sh /etc/ambari-agent/conf/public-hostname.sh
RUN cp /scripts/internal-hostname.sh /etc/ambari-agent/conf/internal-hostname.sh
RUN sed -i "/\[agent\]/ a public_hostname_script=\/etc\/ambari-agent\/conf\/public-hostname.sh" /etc/ambari-agent/conf/ambari-agent.ini
RUN sed -i "/\[agent\]/ a hostname_script=\/etc\/ambari-agent\/conf\/internal-hostname.sh" /etc/ambari-agent/conf/ambari-agent.ini
RUN sed -i "s/agent.task.timeout=900/agent.task.timeout=2000/" /etc/ambari-server/conf/ambari.properties

# Starts ambari agent, server, sets up Postgres dbs
RUN /scripts/initialize.sh

# End user setup -- customize as desired
RUN /scripts/dev-setup.sh

RUN cp /scripts/bashrc /root/.bashrc
RUN cp /scripts/vimrc /root/.vimrc

CMD ["/scripts/start-server.sh"]