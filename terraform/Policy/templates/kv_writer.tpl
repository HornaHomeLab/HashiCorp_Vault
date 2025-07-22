path "${kv_path}/data/*" {
  capabilities = ["create", "update", "read", "list"]
}

path "${kv_path}/metadata/*" {
  capabilities = ["read", "list"]
}

path "${kv_path}/" {
  capabilities = ["list"]
}