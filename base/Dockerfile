FROM centos:7

MAINTAINER @imf <ian.firkin@gmail.com>

RUN yum -y --nogpg install xorg-x11-server-Xvfb.x86_64 fontconfig freetype gettext less htop vim net-tools sudo

ENV USER arcgis
ENV GROUP arcgis

RUN groupadd $GROUP
RUN useradd -m -r $USER -g $GROUP

RUN mkdir -p /home/arcgis/server
RUN chown -R $USER:$GROUP /home/arcgis
RUN chmod -R 755 /home/arcgis

RUN yum clean all

ENTRYPOINT /bin/bash

