variable "vault_url" {
  type = string
  description = "HashiCorp Vault URL"
}
variable "vault_token" {
  type        = string
  description = "HashiCorp Vault root token"
}
variable "kv_path_app_role" {
  type = string
  default = "app_roles"
}
variable "kv_path_certs" {
  type = string
  default = "cert_secrets"
}
variable "kv_path_tailscale" {
  type = string
  default = "tailscale"
}