resource "kubernetes_service_account" "service_account" {
  metadata {
    annotations = merge(var.serviceaccount_spec.annotations,var.annotations)
    labels = merge(var.serviceaccount_spec.labels,var.labels)
    name = var.serviceaccount_spec.user
    namespace = var.namespace
  }
  secret {
    name = kubernetes_secret.secret.metadata.0.name
  }
}

resource "kubernetes_secret" "secret" {
  metadata {
    annotations = merge(var.serviceaccount_spec.annotations,var.annotations)
    labels = merge(var.serviceaccount_spec.labels,var.labels)
    name = var.serviceaccount_spec.user
    namespace= var.namespace
  }
  data = {
    username = var.serviceaccount_spec.user
    password = var.serviceaccount_spec.pass
  }
  type = var.serviceaccount_spec.type
}