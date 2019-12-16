The initialisation for this scenario installs an Istio control plane into the istio-system namespace, as soon as the initialisation completes we can log in to the OpenShift cluster and take a look.

To log in the OpenShift cluster, type `oc login -u system:admin`{{execute T1}}

We can check on the status of the control plane components by inspecting the pods within the istio-system namespace, execute `oc get pods -n istio-system`{{execute T1}}

## Create external routes

OpenShift uses the concept of Routes to expose HTTP services outside the cluster.

Let's create routes to external services like `Grafana`, `Prometheus`, `Tracing`, etc using the following command:

`oc expose svc istio-ingressgateway -n istio-system; \
oc expose svc servicegraph -n istio-system; \
oc expose svc grafana -n istio-system; \
oc expose svc prometheus -n istio-system; \
oc expose svc tracing -n istio-system`{{execute interrupt T1}}

## Add Istio to the path

Now we need to add `istioctl` to the path.

Execute `export PATH=$PATH:/root/installation/istio-1.4.2/bin/`{{execute interrupt T1}}.

Now try it. Check the version of `istioctl`. 

Execute `istioctl version`{{execute T1}}.

