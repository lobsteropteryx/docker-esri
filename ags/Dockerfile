FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>

ADD EDN_AGSADVENT_Portal_20161010.prvc /home
ADD ArcGIS_for_Server_Linux_1041_151978.tar.gz /home

EXPOSE 6080 6443 4001 4002 4003 4004 4005 4006

USER $USER

RUN /home/ArcGISServer/Setup -m silent -l yes -a /home/EDN_AGSADVENT_Portal_20161010.prvc -d /home

RUN ./home/arcgis/server/tools/authorizeSoftware -f /home/EDN_AGSADVENT_Portal_20161010.prvc -e <your.email@your.domain> 

USER root
RUN yum clean all

USER $USER

ENTRYPOINT /home/arcgis/server/startserver.sh && /bin/bash

