# Enable SSH secrets engine (if not already)
resource "vault_mount" "ssh" {
  path        = var.ssh_engine_path
  type        = "ssh"
  description = "SSH CA backend"
}
# Generate the SSH CA key pair
resource "vault_ssh_secret_backend_ca" "ssh_ca" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true
}
resource "vault_ssh_secret_backend_role" "ca_roles" {
  for_each = var.ssh_secret_roles

  name                    = each.key
  backend                 = vault_mount.ssh.path
  key_type                = "ca"
  allow_user_certificates = true
  default_user            = each.value.default_user
  allowed_users           = "*"
  ttl                     = each.value.ttl
  max_ttl                 = each.value.max_ttl

  default_extensions = {
    permit-pty              = ""
    permit-port-forwarding  = ""
    permit-agent-forwarding = ""
  }
}
