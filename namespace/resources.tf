resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = merge(var.namespace_spec.annotations,var.annotations)
    labels = merge(var.namespace_spec.labels,var.labels)
    name = var.namespace_spec.name
  }
}