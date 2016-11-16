FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>

ADD ArcGIS_ServerStandardEnterprise_EDN_2017.prvc /home/arc.prvc
ADD ArcGIS_for_Server_Linux_104_149446.tar.gz /home 

EXPOSE 6080 6443 4001 4002 4003 4004 4005 4006

USER $USER

RUN /home/ArcGISServer/Setup -m silent -l yes -a /home/arc.prvc -d /home && \
rm -rf /home/ArcGISServer 

RUN ./home/arcgis/server/tools/authorizeSoftware -f /home/arc.prvc -e ifirkin@gisinc.com 

# Add script to register self-signed cert
ADD register-cert.sh /home/services/

# Install SLAP
ADD python /home/arcgis/server/tools/python
RUN /home/arcgis/server/tools/python -m pip install --upgrade slap 

ENTRYPOINT /home/arcgis/server/startserver.sh && /bin/bash

