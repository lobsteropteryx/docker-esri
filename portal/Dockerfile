FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>

RUN yum -y --nogpg install libXtst libXrender dos2unix

RUN chmod 4755 /bin/ping

ADD EDN_AGSADVENT_Portal_20161010.prvc /home/
ADD Portal_for_ArcGIS_Linux_1041_151999.tar.gz /home/

EXPOSE 7080 7443

RUN mkdir -p /home/portal
RUN chown -R $USER:$GROUP /home/portal
RUN chmod -R 755 /home/portal

USER $USER

RUN ./home/PortalForArcGIS/Setup -d /home/portal -v -m silent -l yes -a /home/EDN_AGSADVENT_Portal_20161010.prvc

RUN ./home/portal/arcgis/portal/tools/authorizeSoftware -f /home/EDN_AGSADVENT_Portal_20161010.prvc -e <your.email@your.domain>

USER root
RUN yum clean all

USER $USER

ENTRYPOINT ./home/portal/arcgis/portal/framework/etc/agsportal.sh start && /bin/bash

