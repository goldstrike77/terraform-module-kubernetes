resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = merge(var.deploy_spec.namespace.annotations,var.annotations)
    labels = merge(var.deploy_spec.namespace.labels,var.labels)
    name = var.deploy_spec.namespace.name
  }
}