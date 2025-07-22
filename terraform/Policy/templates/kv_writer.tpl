path "${kv_path}/data/*" {
  capabilities = ["create", "update", "read", "list", "delete"]
}

path "${kv_path}/metadata/*" {
  capabilities = ["read", "list"]
}

path "${kv_path}/" {
  capabilities = ["list"]
}