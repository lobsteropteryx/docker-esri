docker run \
    -it  \
    --rm \
    --hostname arcgis \
    --memory-swappiness=0 \
    -p 7080:7080 \
    -p 7443:7443 \
portal
