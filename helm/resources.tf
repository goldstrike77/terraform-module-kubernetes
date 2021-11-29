resource "helm_release" "release" {
  for_each = var.deploy_spec.helm
  namespace = var.deploy_spec.namespace.name
  create_namespace = true
  name = each.value.name
  repository = each.value.repository
  chart = each.value.chart
  version = each.value.version
  values = lookup(each.value, "values", []) == [] ? [] : [file(each.value.values)]
}