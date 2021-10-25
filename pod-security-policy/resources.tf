resource "kubernetes_pod_security_policy" "pod_security_policy" {
  metadata {
    annotations = merge(var.deploy_spec.serviceaccount.annotations,var.annotations)
    labels = merge(var.deploy_spec.serviceaccount.labels,var.labels)
    name = var.deploy_spec.serviceaccount.user
  }
  spec {
    privileged = lookup(var.deploy_spec.podsecuritypolicy, "privileged", false)
    allow_privilege_escalation = lookup(var.deploy_spec.podsecuritypolicy, "allow_privilege_escalation", false)
    volumes = var.deploy_spec.podsecuritypolicy.volumes
    host_ipc = lookup(var.deploy_spec.podsecuritypolicy, "host_ipc", false)
    host_network = lookup(var.deploy_spec.podsecuritypolicy, "host_network", false)
    host_pid = lookup(var.deploy_spec.podsecuritypolicy, "host_pid", false)
    run_as_user {
      rule = var.deploy_spec.podsecuritypolicy.run_as_user
    }
    se_linux {
      rule = var.deploy_spec.podsecuritypolicy.se_linux
    }
    supplemental_groups {
      rule = var.deploy_spec.podsecuritypolicy.supplemental_groups
    }
    fs_group {
      rule = var.deploy_spec.podsecuritypolicy.fs_group
    }
    read_only_root_filesystem = lookup(var.deploy_spec.podsecuritypolicy, "read_only_root_filesystem", true)
    required_drop_capabilities = lookup(var.deploy_spec.podsecuritypolicy, "required_drop_capabilities", ["ALL"])
  }
}