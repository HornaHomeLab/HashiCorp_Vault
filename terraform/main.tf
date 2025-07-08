provider "vault" {
  address = "http://vault.horna.local:8200"
  token   = var.vault_token
}

variable "secret_backend_name" {
  type = string
  default = "horna-local-subdomains"
}

module "pki_engine" {
  source = "./pki-engine"
  common_name = "Horna.local"
  description = "Root CA for horna.local"
  vault_url = "https://vault.horna.local"
  subdomain_allowed = [ "horna.local"]
  secret_backend_name = var.secret_backend_name
}
