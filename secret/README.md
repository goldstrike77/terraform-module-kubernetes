```hcl
    secret = {
      grafana = {
        annotations = {}
        labels = {}
        type = "kubernetes.io/basic-auth"
        data = {
          username = "admin"
          password = "changeme"
        }
      }
    }
```