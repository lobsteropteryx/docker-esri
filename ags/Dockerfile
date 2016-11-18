FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>

ADD ArcGIS_ServerStandardEnterprise_EDN_2017.prvc /home

EXPOSE 6080 6443 4001 4002 4003 4004 4005 4006

USER arcgis 

WORKDIR /home
RUN wget http://D7510-1613.gisinc.local:8000/ArcGIS_for_Server_Linux_104_149446.tar.gz && \
tar -xvzf ArcGIS_for_Server_Linux_104_149446.tar.gz && \
rm ArcGIS_for_Server_Linux_104_149446.tar.gz && \
/home/ArcGISServer/Setup -m silent -l yes -a /home/ArcGIS_ServerStandardEnterprise_EDN_2017.prvc -d /home/arcgis && \
rm -rf /home/ArcGISServer

RUN /home/arcgis/server/tools/authorizeSoftware -f /home/ArcGIS_ServerStandardEnterprise_EDN_2017.prvc -e ian.firkin@gisinc.com 

# SSH doesn't set the user, so modify the script that calls python in WINE
ADD python /home/arcgis/server/tools/python

ENTRYPOINT /home/arcgis/server/startserver.sh && /bin/bash

