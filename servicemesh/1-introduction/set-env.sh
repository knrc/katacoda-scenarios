echo "Waiting for Initialisation of Istio control plane to complete"
until [ -f /tmp/initialised ] ; do (echo -n .; sleep 2); done
/usr/local/bin/launch.sh
