docker build\
  --build-arg BUILD_HOST=192.168.56.1:8000 \
  --build-arg PRVC=ArcGISGISServerAdvanced_ArcGISServer_526454.prvc \
  --build-arg AGS_INSTALLER=ArcGIS_Server_Linux_105_pr_153237.tar.gz \
  --force-rm=true\
  --ulimit nofile=65535:65535\
  --ulimit nproc=25059:25059\
  -t ags10.5 .
