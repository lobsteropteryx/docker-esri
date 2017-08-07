FROM arcgis-base

MAINTAINER @imf <ian.firkin@gisinc.com>

ADD ArcGISforServerAdvancedEnterprise_Server_547695.prvc /home/arcgis/arc.prvc
EXPOSE 6080 6443 4001 4002 4003 4004 4005 4006

USER arcgis 

ARG BUILD_HOST
ARG AGS_INSTALLER
WORKDIR /home/arcgis
RUN wget http://$BUILD_HOST/$AGS_INSTALLER && \
tar -xvzf $AGS_INSTALLER && \
rm $AGS_INSTALLER && \
~/ArcGISServer/Setup -m silent -l yes -a ~/arc.prvc -d ~/ && \
rm -rf ~/ArcGISServer

RUN ~/server/tools/authorizeSoftware -f ~/arc.prvc -e ian.firkin@gmail.com 

# SSH doesn't set the user, so modify the script that calls python in WINE
ADD python /home/arcgis/server/tools/python

ENTRYPOINT ~/server/startserver.sh && /bin/bash
