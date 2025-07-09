path "cert-secrets/data/*" {
  capabilities = ["read", "list"]
}
path "cert-secrets/metadata/*" {
  capabilities = ["read", "list"]
}
path "cert-secrets/" {
  capabilities = [ "list"]
}