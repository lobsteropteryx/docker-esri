docker run \
    -it --rm \
    --hostname arcgis \
    --memory-swappiness=0 \
    -p 6080:6080 \
postgres
