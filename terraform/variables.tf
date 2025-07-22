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
variable "kv_path_infrastructure" {
  type = string
  default = "infrastructure"
}
variable "kv_path_external_providers" {
  type = string
  default = "external_providers"
}
variable "kv_path_dot_env_file" {
  type = string
  default = "dot_env_file"
}
variable "kv_path_proxmox_vms" {
  type = string
  default = "proxmox_vms"
}