resource "kubernetes_network_policy" "network_policy" {
  for_each = var.deploy_spec.networkpolicy
  metadata {
    annotations = merge(var.deploy_spec.serviceaccount.annotations,var.annotations)
    labels = merge(var.deploy_spec.serviceaccount.labels,var.labels)
    name = "${var.deploy_spec.serviceaccount.user}-${each.key}"
    namespace = var.deploy_spec.namespace.name
  }

  spec {
    policy_types = each.value.policytypes
    dynamic "pod_selector" {
      for_each = length(each.value.podselector) == 0 ? [1] : []
      content {}
    }
    dynamic "pod_selector" {
      for_each = length(each.value.podselector) == 0 ? [] : [1]
      content {
        match_expressions {
          key      = each.value.podselector.key
          operator = title(each.value.podselector.operator)
          values   = each.value.podselector.values
        }
      }
    }

    ingress {
      <<-EOT
      yamldecode(each.value.ingress)
      EOT
    }
/*

    dynamic "ingress" {
      for_each = length(each.value.ingress) == 0 ? [1] : []
      content {}
    }
    dynamic "ingress" {
      for_each = length(each.value.ingress) == 0 ? [] : [1]
      content {
        yamldecode(each.value.ingress)
      }
    }
*/


    
/*
    ingress {
      ports {
        port     = "http"
        protocol = "TCP"
      }
      ports {
        port     = "8125"
        protocol = "UDP"
      }

      from {
        namespace_selector {
          match_labels = {
            name = "default"
          }
        }
      }

      from {
        ip_block {
          cidr = "10.0.0.0/8"
          except = [
            "10.0.0.0/24",
            "10.0.1.0/24",
          ]
        }
      }
    }
*/
  }
}