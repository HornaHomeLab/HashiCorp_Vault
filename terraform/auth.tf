module "policies" {
  source = "./Policy"
  resource_policy_reader = [
    var.kv_path_infrastructure,
    var.kv_path_certs,
    var.kv_path_tailscale,
    var.kv_path_external_providers,
    var.kv_path_dot_env_file,
    var.kv_path_proxmox_vms
  ]
  resource_policy_writer = [
    var.kv_path_proxmox_vms,
    var.kv_path_infrastructure,
  ]
}
module "github_authentication" {
  source             = "./github-auth"
  github_org_name    = "HornaHomeLab"
  github_team_admins = "vault-admin"
  github_team_users  = "vault-user"
}
