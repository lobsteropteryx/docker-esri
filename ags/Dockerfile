FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>
RUN yum -y install mesa-libGLU libXtst libXi libXrender 
RUN yum -y --nogpg install python-pip python-wheel 

ADD ArcGIS_ServerStandardEnterprise_EDN_2017.prvc /home/arc.prvc

USER $USER
WORKDIR /home
RUN wget http://D7510-1613.gisinc.local:8000/ArcGIS_for_Server_Linux_1031_145870.tar.gz && \
tar -xvzf ArcGIS_for_Server_Linux_1031_145870.tar.gz && \
rm ArcGIS_for_Server_Linux_1031_145870.tar.gz && \
/home/ArcGISServer/Setup -m silent -l yes -a /home/arc.prvc -d /home && \
rm -rf /home/ArcGISServer

EXPOSE 6080 6443 4001 4002 4003 4004 4005 4006

# Add script to register self-signed cert
ADD register-cert.sh /home/services/

# Install SLAP
ADD python /home/arcgis/server/tools/python
#ADD get-pip.py /home/
#RUN /home/arcgis/server/tools/python /home/get-pip.py
#RUN /home/arcgis/server/tools/python -m pip install --upgrade slap 
ENTRYPOINT /bin/bash
#ENTRYPOINT /home/arcgis/server/startserver.sh && /bin/bash

