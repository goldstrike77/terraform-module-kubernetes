resource "kubernetes_storage_class" "storage_class" {
  for_each = var.deploy_spec.storageclass
  metadata {
    annotations = merge(each.value.annotations,var.annotations)
    labels = merge(each.value.labels,var.labels)
    name = each.key
  }
  storage_provisioner = each.value.storage_provisioner
  reclaim_policy = lookup(each.value, "reclaim_policy", "Retain")
  parameters = each.value.parameters
  volume_binding_mode = lookup(each.value, "volume_binding_mode", "Immediate")
  allow_volume_expansion = lookup(each.value, "allow_volume_expansion", true)
  mount_options = each.value.mount_options
}