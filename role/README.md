```hcl
    role = {
      rule01 = {
        api_groups = [""]
        resources  = ["*"]
        verbs = ["create","delete","deletecollection","get","list","patch","update","watch"]
      }
    }
```