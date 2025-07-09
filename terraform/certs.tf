module "cert_vault" {
  depends_on = [ module.pki_engine,vault_mount.cert_secrets_kv ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  kv_path = vault_mount.cert_secrets_kv.path
  common_name = "vault.horna.local"
}
module "cert_docker-hub" {
  depends_on = [ module.pki_engine,vault_mount.cert_secrets_kv ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  kv_path = vault_mount.cert_secrets_kv.path
  common_name = "docker-hub.horna.local"
}
module "cert_grafana" {
  depends_on = [ module.pki_engine,vault_mount.cert_secrets_kv ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  kv_path = vault_mount.cert_secrets_kv.path
  common_name = "grafana.horna.local"
}
module "cert_prometheus" {
  depends_on = [ module.pki_engine, vault_mount.cert_secrets_kv ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  kv_path = vault_mount.cert_secrets_kv.path
  common_name = "prometheus.horna.local"
}