docker run \
    -it --rm \
    --hostname arcgis \
    --memory-swappiness=0 \
    -p 6080:6080 \
    -p 6443:6443 \
    -p 4000:4000 \
    -p 4001:4001 \
    -p 4002:4002 \
    -p 4003:4003 \
arcgis
