FROM arcgis-base

MAINTAINER @imf <ian.firkin@gmail.com>
RUN yum -y install mesa-libGLU libXtst libXi libXrender 
RUN yum -y --nogpg install python-pip python-wheel 

ARG PRVC
ARG AGS_INSTALLER

ADD $PRVC /home/arc.prvc

USER $USER
WORKDIR /home
RUN wget http://D7510-1613.gisinc.local:8000/$AGS_INSTALLER && \
tar -xvzf $AGS_INSTALLER && \
rm $AGS_INSTALLER && \
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

