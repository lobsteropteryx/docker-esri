# The self-signed cert changes the first time the AGS server is started, so we'll need to call this as 
# part of our ENTRYPOINT when we run this container.  It doesn't seem to matter if we do it during the image
# build, the cert is still different once we start the container and fire up AGS, possibly due to hostname change.
cp /etc/pki/tls/certs/ca-bundle.crt /etc/pki/tls/certs/ca-bundle-orig.crt 
mkdir ~/certs
CERTFILE=~/sscert.pem
        openssl s_client -connect localhost:6443 -showcerts && \
        /home/arcgis/server/startserver.sh && openssl x509 -inform DER -in /home/arcgis/server/framework/etc/certificates/SelfSignedCertificate.cer -out $CERTFILE && \
        cat $CERTFILE >> /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem && \
        cat $CERTFILE >> /etc/pki/ca-trust/extracted/pem/ca-bundle.trust.crt
#diff /etc/pki/tls/certs/ca-bundle-orig.crt /etc/pki/tls/certs/ca-bundle.crt


