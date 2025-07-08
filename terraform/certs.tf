module "cert_vault" {
  depends_on = [ module.pki_engine ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  common_name = "vault.horna.local"
}
module "cert_docker-hub" {
  depends_on = [ module.pki_engine ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  common_name = "docker-hub.horna.local"
}
module "cert_grafana" {
  depends_on = [ module.pki_engine ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  common_name = "grafana.horna.local"
}
module "cert_prometheus" {
  depends_on = [ module.pki_engine ]
  source = "./pki-cert"
  secret_backend_name = var.secret_backend_name
  common_name = "prometheus.horna.local"
}