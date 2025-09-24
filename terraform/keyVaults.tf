resource "vault_mount" "app_roles_kv" {
  path        = var.kv_path_app_role
  type        = "kv"
  description = "KV for storing AppRole credentials"
  options = {
    version = "2"
  }
}
resource "vault_mount" "cert_secrets_kv" {
  path        = var.kv_path_certs
  type        = "kv"
  description = "KV storage for certs"
  options = {
    version = "2"
  }
}

# Create KV, which will be filled in by engineer or other automation
resource "vault_mount" "key_vaults" {
  for_each = {
    "${var.kv_path_external_providers}" = "KV storage for external provider credentials"
    "${var.kv_path_tailscale}"          = "KV storage for Tailscale secrets"
    "${var.kv_path_infrastructure}"     = "KV storage for infrastructure credentials"
    "${var.kv_path_dot_env_file}"       = "KV storage for .env file"
    "${var.kv_path_proxmox_vms}"        = "KV storage for proxmox vm credentials"
    "${var.kv_path_minio_accounts}"     = "KV storage for MinIO credentials"
  }
  path        = each.key
  type        = "kv"
  description = each.value
  options = {
    version = "2"
  }
}
