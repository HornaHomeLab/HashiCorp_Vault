resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle"
}
module "terraform_app_role" {
  source                = "./app-role"
  app_role_backend_path = vault_auth_backend.approle.path
  kv_path               = vault_mount.app_roles_kv.path
  app_role_name         = "Terraform"
  app_role_policies     = ["certificates_reader", "root_ca_reader", "infrastructure_reader"]
}
module "github_app_role" {
  source                = "./app-role"
  app_role_backend_path = vault_auth_backend.approle.path
  kv_path               = vault_mount.app_roles_kv.path
  app_role_name         = "GitHub_Actions"
  app_role_policies     = ["root_ca_reader", "tailscale_secrets_reader"]
}
