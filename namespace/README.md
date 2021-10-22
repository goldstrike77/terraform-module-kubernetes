#### Usage
Only the release number needs to be modified.
```hcl
module "namespace" {
  source         = "git::https://github.com/goldstrike77/terraform-module-kubernetes.git//namespace?ref=v0.1"
  namespace_spec = var.namespace_spec
  annotations    = var.annotations
  labels         = var.labels
}
```

#### Variables
There are some variables that can (Or needs to) be overridden:
```hcl
variable "namespace_spec" {
  default = {
    name = "test"
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