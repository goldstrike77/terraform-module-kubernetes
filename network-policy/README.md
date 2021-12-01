```hcl
    networkpolicy = {
      policy01 = {
        policytypes = ["Ingress","Egress"]
        podselector = {}
        ingress = {
          ports = {
            port = "443"
            protocol = "TCP"
          }
          ports = {
            port = "80"
            protocol = "TCP"
          }
        }
        egress = [""]
      }
```