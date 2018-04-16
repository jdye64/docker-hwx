FROM jdye64/docker-hwx:hdf-3.1.1-base
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

# Install and prep Ambari Agent
RUN yum install -y ambari-agent && ambari-agent start

# Setup networking
ADD scripts /scripts
RUN cp /scripts/public-hostname.sh /etc/ambari-agent/conf/public-hostname.sh
RUN cp /scripts/internal-hostname.sh /etc/ambari-agent/conf/internal-hostname.sh
RUN sed -i "/\[agent\]/ a public_hostname_script=\/etc\/ambari-agent\/conf\/public-hostname.sh" /etc/ambari-agent/conf/ambari-agent.ini
RUN sed -i "/\[agent\]/ a hostname_script=\/etc\/ambari-agent\/conf\/internal-hostname.sh" /etc/ambari-agent/conf/ambari-agent.ini
RUN sed -i "s/hostname=localhost/hostname=nifi-master.dev/g" /etc/ambari-agent/conf/ambari-agent.ini

# End user setup -- customize as desired
RUN /scripts/dev-setup.sh

RUN cp /scripts/bashrc /root/.bashrc
RUN cp /scripts/vimrc /root/.vimrc

CMD ["/scripts/start-agent.sh"]