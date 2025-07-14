module "policies" {
  source = "./Policy"
  resource_policy_reader = [
    var.kv_path_infrastructure,
    var.kv_path_certs,
    var.kv_path_tailscale,
    var.kv_path_external_providers,
    var.kv_path_dot_env_file,
  ]
}
module "github_authentication" {
  source             = "./github-auth"
  github_org_name    = "HornaHomeLab"
  github_team_admins = "vault-admin"
  github_team_users  = "vault-user"
}
