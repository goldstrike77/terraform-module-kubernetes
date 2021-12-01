resource "kubernetes_secret" "secret" {
  for_each = var.deploy_spec.secret
  metadata {
    annotations = merge(each.value.annotations,var.annotations)
    labels = merge(each.value.labels,var.labels)
    name = each.key
    namespace = var.deploy_spec.namespace.name
  }
  type = each.value.type
  data = each.value.data
}