FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>

RUN rpm -ivh http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-1.noarch.rpm
RUN yum -y install epel-release
RUN yum -y install postgresql94-server.x86_64 postgresql94-contrib.x86_64 postgis2_94.x86_64  

USER postgres

RUN /usr/pgsql-9.4/bin/initdb -D /var/lib/pgsql/data/9.4
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/pgsql/data/9.4/pg_hba.conf

RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/9.4/postgresql.conf

EXPOSE 5432

USER root
RUN yum clean all

#ENTRYPOINT /bin/bash
ENTRYPOINT /usr/pgsql-9.4/bin/postgres -D /var/lib/pgsql/data/9.4 -c config_file=/var/lib/pgsql/data/9.4/postgresql.conf && /bin/bash

