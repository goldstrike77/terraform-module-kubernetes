resource "kubernetes_role" "role" {
  metadata {
    annotations = merge(var.deploy_spec.serviceaccount.annotations,var.annotations)
    labels = merge(var.deploy_spec.serviceaccount.labels,var.labels)
    name = var.deploy_spec.serviceaccount.user
    namespace = var.deploy_spec.namespace.name
  }
  dynamic "rule" {
    for_each = var.deploy_spec.role
    content {
      api_groups = lookup(rule.value, "api_groups", null)
      resources = lookup(rule.value, "resources", null)
      verbs = lookup(rule.value, "verbs", null)
    }
  }
}

resource "kubernetes_role_binding" "role_binding" {
  metadata {
    annotations = merge(var.deploy_spec.serviceaccount.annotations,var.annotations)
    labels = merge(var.deploy_spec.serviceaccount.labels,var.labels)
    name = var.deploy_spec.serviceaccount.user
    namespace = var.deploy_spec.namespace.name
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "Role"
    name = var.deploy_spec.serviceaccount.user
  }
  subject {
    api_group = ""
    kind = "ServiceAccount"
    namespace = var.deploy_spec.namespace.name
    name = var.deploy_spec.serviceaccount.user
  }
}