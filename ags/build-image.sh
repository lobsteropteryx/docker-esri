docker build\
  --build-arg BUILD_HOST=$COMPUTERNAME.$USERDNSDOMAIN:8000\
  --force-rm=true\
  --ulimit nofile=65535:65535\
  --ulimit nproc=25059:25059\
  -t ags10.4 .
