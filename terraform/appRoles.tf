resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle"
}
module "terraform_app_role" {
  source                = "./app-role"
  app_role_backend_path = vault_auth_backend.approle.path
  kv_path               = vault_mount.app_roles_kv.path
  app_role_name         = "Terraform"
  app_role_policies = [
    module.policies.templated_reader_policies[var.kv_path_infrastructure],
    module.policies.templated_reader_policies[var.kv_path_certs],
    module.policies.templated_reader_policies[var.kv_path_external_providers],
    module.policies.templated_reader_policies[var.kv_path_dot_env_file],
    "root_ca_reader",
  ]
}
module "github_app_role" {
  source                = "./app-role"
  app_role_backend_path = vault_auth_backend.approle.path
  kv_path               = vault_mount.app_roles_kv.path
  app_role_name         = "GitHub_Actions"
  app_role_policies = [
    module.policies.templated_reader_policies[var.kv_path_tailscale],
    "root_ca_reader"
  ]
}
