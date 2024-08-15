# P = Prometheus
# G = Grafana
# D = Deployment
# S = Service
# C = Configmap
apply these file in a cronological order using 

``` kubectle apply -f filename.yaml ```

p-c > p-d > p-s> g-d> g-s.yaml

then check nodeport of grafana,
```kubectl get svc -n monitoring grafana```

Now open access using nodeport
