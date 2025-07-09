path "tailscale/data/*" {
  capabilities = ["read", "list"]
}
path "tailscale/metadata/*" {
  capabilities = ["read", "list"]
}
path "tailscale/" {
  capabilities = ["list"]
}
