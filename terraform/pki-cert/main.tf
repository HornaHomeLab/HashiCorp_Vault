resource "vault_pki_secret_backend_cert" "cert" {
  backend     = "pki"
  name        = var.secret_backend_name
  common_name = var.common_name
  ttl         = var.cert_ttl

  # auto_renew  = true
  lifecycle {
    prevent_destroy = false
  }
}

# Copy secrets data to allow using it after creation
resource "vault_kv_secret_v2" "cert_storage" {

  mount = var.kv_path
  name  = var.common_name

  data_json = jsonencode({
    certificate = vault_pki_secret_backend_cert.cert.certificate
    private_key = vault_pki_secret_backend_cert.cert.private_key
    issuing_ca  = vault_pki_secret_backend_cert.cert.issuing_ca

  })
}
