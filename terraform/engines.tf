variable "secret_backend_name" {
  type    = string
  default = "horna-local-subdomains"
}
module "pki_engine" {
  source              = "./pki-engine"
  common_name         = "Horna.local"
  description         = "Root CA for horna.local"
  vault_url           = var.vault_url
  subdomain_allowed   = ["horna.local"]
  secret_backend_name = var.secret_backend_name
}
module "ssh_engine" {
  source      = "./ssh-engine"
  ssh_kv_path = "ssh_keys"
  ssh_secret_roles = {
    "proxmox" = {
      default_user = "proxmox"
      ttl          = "86400"  # 24h
      max_ttl      = "604800" # 7d
    }
  }
}
