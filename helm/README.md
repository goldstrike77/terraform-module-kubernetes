```hcl
    helm = {
      loki-distributed = {
        repository = "https://grafana.github.io/helm-charts"
        chart = "loki-distributed"
        version = "0.39.2"
        values = "loki-distributed.yaml"
      },
      ingress-nginx = {
        repository = "https://kubernetes.github.io/ingress-nginx"
        chart = "ingress-nginx"
        version = "4.0.12"
        values = "ingress-nginx.yaml"
      },
      grafana = {
        repository = "https://grafana.github.io/helm-charts"
        chart = "grafana"
        version = "6.17.8"
        values = "grafana.yaml"
      }
    }
```