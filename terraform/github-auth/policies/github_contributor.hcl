path "cert_secrets/data/*" {
  capabilities = ["read", "list"]
}
path "cert_secrets/metadata/*" {
  capabilities = ["read", "list"]
}
path "cert_secrets/" {
  capabilities = [ "list"]
}
path "pki/cert/ca" {
  capabilities = ["read"]
}