```hcl
    serviceaccount = {
      user = "grafana-loki-operator"
      annotations = {
        identify = "false"
      }
      labels = {
        identify = "true"
      }
    }
```