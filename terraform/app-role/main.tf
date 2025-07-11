resource "vault_policy" "app_role_can_issue_token" {
  name   = "app_role_can_issue_token"
  policy = file("${path.module}/app_role_can_issue_token.hcl")
}

resource "vault_approle_auth_backend_role" "app_role" {
  backend        = var.app_role_backend_path
  role_name      = var.app_role_name
  token_policies = setunion(var.app_role_policies, [vault_policy.app_role_can_issue_token.name])
  token_ttl      = 3600
  token_max_ttl  = 86400
}

# Create Secret ID
resource "vault_approle_auth_backend_role_secret_id" "app_role_secret" {
  backend   = var.app_role_backend_path
  role_name = vault_approle_auth_backend_role.app_role.role_name
}

# Store role_id and secret_id in KV 
resource "vault_kv_secret_v2" "app_role_kv_entry" {
  mount = var.kv_path
  name  = var.app_role_name

  data_json = jsonencode({
    role_id   = vault_approle_auth_backend_role.app_role.role_id
    secret_id = vault_approle_auth_backend_role_secret_id.app_role_secret.secret_id
  })
}
