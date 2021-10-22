#### Usage
Only the release number needs to be modified.
```hcl
module "serviceaccount" {
  source              = "git::https://github.com/goldstrike77/terraform-module-kubernetes.git//service-account?ref=v0.1"
  serviceaccount_spec = var.serviceaccount_spec
  annotations         = var.annotations
  labels              = var.labels
  namespace           = module.namespace.namespace_id
}
```

#### Variables
There are some variables that can (Or needs to) be overridden:
```hcl
variable "serviceaccount_spec" {
  default = {
    user = "loki"
    pass = "changeme"
    type = "Opaque"
    annotations = {
      identify = "false"
    }
    labels = {
      identify = "true"
    }
  }
}

variable "annotations" {
  default = {
    imageregistry = "https://hub.docker.com/"
  }
}

variable "labels" {
  default = {
    release = "stable"
    tier = "frontend"
  }
}
```