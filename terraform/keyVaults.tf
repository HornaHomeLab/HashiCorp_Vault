resource "vault_mount" "app_roles_kv" {
  path = var.kv_path_app_role
  type = "kv"
  options = {
    version = "2"
  }
  description = "KV for storing AppRole credentials"
}
resource "vault_mount" "cert_secrets_kv" {
  path        = var.kv_path_certs
  type        = "kv"
  description = "KV storage for certs"

  options = {
    version = "2"
  }
}
resource "vault_mount" "tailscale_kv" {
  path        = var.kv_path_tailscale
  type        = "kv"
  description = "KV storage for Tailscale secrets"

  options = {
    version = "2"
  }
}
