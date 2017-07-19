docker build \
  --build-arg BUILD_HOST=192.168.56.1:8000 \
  --build-arg AGS_INSTALLER=ArcGIS_for_Server_Linux_104_149446.tar.gz \
  --force-rm=true \
  --ulimit nofile=65535:65535 \
  --ulimit nproc=25059:25059 \
  -t ags10.4 .
