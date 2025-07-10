resource "vault_github_auth_backend" "horna_org" {
  organization = var.github_org_name

  tune {
    allowed_response_headers     = []
    audit_non_hmac_request_keys  = []
    audit_non_hmac_response_keys = []
    default_lease_ttl            = "168h"
    listing_visibility           = "unauth"
    max_lease_ttl                = "7200h"
    passthrough_request_headers  = []
    token_type                   = "default-service"
  }
}
resource "vault_policy" "gh_admin_policy" {
  name   = "github_administrator"
  policy = file("${path.module}/policies/github_administrator.hcl")
}
resource "vault_policy" "gh_contributor_policy" {
  name   = "github_contributor"
  policy = file("${path.module}/policies/github_contributor.hcl")
}
resource "vault_github_team" "gh_admin_team" {
  depends_on = [vault_policy.gh_admin_policy, vault_github_auth_backend.horna_org]
  backend    = vault_github_auth_backend.horna_org.id
  team       = var.github_administrators_name
  policies   = [vault_policy.gh_admin_policy.name]
}
resource "vault_github_team" "gh_contributor_team" {
  depends_on = [vault_policy.gh_contributor_policy, vault_github_auth_backend.horna_org]
  backend    = vault_github_auth_backend.horna_org.id
  team       = var.github_contributors_name
  policies   = [vault_policy.gh_contributor_policy.name]
}
