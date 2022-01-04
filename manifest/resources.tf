resource "kubernetes_manifest" "manifest" {
  count = length(local.yamls)
  manifest = local.yamls[count.index]
}