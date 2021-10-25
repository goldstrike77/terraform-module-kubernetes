resource "kubernetes_service_account" "service_account" {
  metadata {
    annotations = merge(var.deploy_spec.serviceaccount.annotations,var.annotations)
    labels = merge(var.deploy_spec.serviceaccount.labels,var.labels)
    name = var.deploy_spec.serviceaccount.user
    namespace = var.deploy_spec.namespace.name
  }
  automount_service_account_token = true
}