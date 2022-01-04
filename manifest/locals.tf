locals {
  yamls = [for data in split("---", var.deploy_spec.manifest): yamldecode(data)]
}