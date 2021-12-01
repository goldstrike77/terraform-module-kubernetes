```hcl
    podsecuritypolicy = {
      privileged = false
      allow_privilege_escalation = false
      volumes = ["configMap","emptyDir","persistentVolumeClaim","secret"]
      host_ipc = false
      host_network = false
      host_pid = false
      run_as_user = "MustRunAsNonRoot"
      se_linux = "RunAsAny"
      supplemental_groups = "MustRunAs"
      fs_group = "MustRunAs"
      read_only_root_filesystem = false
      required_drop_capabilities = ["ALL"]
    }
```