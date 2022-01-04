resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = merge(var.deploy_spec.namespace.annotations,var.annotations)
    labels = merge(var.deploy_spec.namespace.labels,var.labels)
    name = var.deploy_spec.namespace.name
  }
  lifecycle {
    ignore_changes = [
      metadata.0.annotations["cattle.io/status"],
      metadata.0.annotations["lifecycle.cattle.io/create.namespace-auth"],
      metadata.0.labels["field.cattle.io/projectId"],
    ]
  }
}