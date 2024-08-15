# P = Prometheus
# G = Grafana
# D = Deployment
# S = Service
# C = Configmap
**First create a namespace monitoring** <br/>
``` kubectl create namespace monitoring ``` <br/>
apply these file in a cronological order using <br/>

``` kubectle apply -f filename.yaml ```<br/>

p-c > p-d > p-s> g-d> g-s.yaml

then check nodeport of grafana,
```kubectl get svc -n monitoring grafana```

Now open access Grafana using nodeport

# 1. Connect Grafana to Prometheus
Log into the Grafana UI at http://localhost:3000.<br/>
Go to Configuration -> Data Sources.<br/>
Add a new data source of type Prometheus.<br/>
Set the URL to http://prometheus.monitoring.svc.cluster.local:9090 (the internal service DNS name in Kubernetes).<br/>
Save & Test the data source.<br/>

# 2. Import Grafana Dashboards
In the Grafana UI, click on the + icon on the left-hand side and choose Import.<br/>
You can import existing Kubernetes dashboards like:<br/>
Kubernetes Cluster Monitoring (ID: 315)<br/>
Node Exporter Full (ID: 1860)<br/>
