docker build\
  --build-arg BUILD_HOST=192.168.1.47:8000 \
  --build-arg PRVC=ArcGISforServerAdvancedEnterprise_Server_547695.prvc \
  --build-arg AGS_INSTALLER=ArcGIS_for_Server_Linux_104_149446.tar.gz \
  --force-rm=true\
  --ulimit nofile=65535:65535\
  --ulimit nproc=25059:25059\
  -t ags10.4 .
