provider "vault" {
  token   = var.vault_token
  address = var.vault_url
}
terraform {
  backend "http" {
    address = "http://10.0.10.11:8001/state/HashiCorp_Vault/prod"
  }
}
data "terraform_remote_state" "foo" {
  backend = "http"
  config = {
    address = "http://10.0.10.11:8001/state/HashiCorp_Vault/prod"
  }
}
