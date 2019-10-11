FROM postgres
MAINTAINER Jeremy Dyer <jdye64@gmail.com>

ARG DDL_URL
ADD scripts/* /docker-entrypoint-initdb.d/
RUN apt-get update
RUN apt-get install -y wget
RUN wget ${DDL_URL}
ADD pg_hba.conf /
