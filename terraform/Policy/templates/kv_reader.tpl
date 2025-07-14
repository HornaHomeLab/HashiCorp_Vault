path "${kv_path}/data/*" {
  capabilities = ["read", "list"]
}

path "${kv_path}/metadata/*" {
  capabilities = ["read", "list"]
}

path "${kv_path}/" {
  capabilities = ["list"]
}