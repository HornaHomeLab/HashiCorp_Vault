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
    module.policies.templated_reader_policies[var.kv_path_proxmox_vms],
    module.policies.templated_writer_policies[var.kv_path_proxmox_vms],
    "root_ca_reader",
  ]
}
module "ansible_app_role" {
  source                = "./app-role"
  app_role_backend_path = vault_auth_backend.approle.path
  kv_path               = vault_mount.app_roles_kv.path
  app_role_name         = "Ansible"
  app_role_policies = [
    module.policies.templated_reader_policies[var.kv_path_certs],
    module.policies.templated_reader_policies[var.kv_path_proxmox_vms],
    module.policies.templated_writer_policies[var.kv_path_infrastructure],
    "root_ca_reader",
    "ssh_ca_reader",
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
module "docker_image_builder_app_role" {
  source                = "./app-role"
  app_role_backend_path = vault_auth_backend.approle.path
  kv_path               = vault_mount.app_roles_kv.path
  app_role_name         = "docker_image_builder"
  app_role_policies = [
    module.policies.templated_reader_policies[var.kv_path_certs],
  ]
}
