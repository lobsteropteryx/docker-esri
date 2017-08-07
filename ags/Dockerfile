FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>
RUN yum -y --nogpg install mesa-libGLU libXtst libXi libXrender wget

ARG PRVC
ARG AGS_INSTALLER
ARG BUILD_HOST
ADD $PRVC /home/arcgis/arc.prvc

USER $USER
WORKDIR /home/arcgis
RUN wget http://$BUILD_HOST/$AGS_INSTALLER && \
tar -xvzf $AGS_INSTALLER && \
rm $AGS_INSTALLER && \
/home/arcgis/ArcGISServer/Setup -m silent -l yes -a /home/arcgis/arc.prvc -d ~/ && \
rm -rf /home/arcgis/ArcGISServer

EXPOSE 6080 6443 4001 4002 4003 4004 4005 4006

# Add script to register self-signed cert
ADD register-cert.sh /home/services/

# Install SLAP
ADD python /home/arcgis/server/tools/python
ENTRYPOINT /home/arcgis/server/startserver.sh && /bin/bash

