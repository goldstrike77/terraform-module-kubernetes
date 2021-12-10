```hcl
    storageclass = {
      smb-client = {
        annotations = {}
        labels = {}
        storage_provisioner = "smb.csi.k8s.io"
        reclaim_policy = "Retain"
        parameters = {
          "source" = "//dem-p-inf-oss01.node.dc01.local/smb"
          "csi.storage.k8s.io/node-stage-secret-name" = "smbcreds"
          "csi.storage.k8s.io/node-stage-secret-namespace" = "default"
        }
        volume_binding_mode = "Immediate"
        allow_volume_expansion = true
        mount_options = ["dir_mode=0777", "file_mode=0640", "uid=1001", "gid=1001"]
      }
    }
```