docker build\
  --force-rm=true\
  --ulimit nofile=65535:65535\
  --ulimit nproc=25059:25059\
  -t postgres .
