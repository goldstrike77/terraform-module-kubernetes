terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
    }
  }
}

resource "kubectl_manifest" "manifest" {
  yaml_body = var.deploy_spec.manifest
}