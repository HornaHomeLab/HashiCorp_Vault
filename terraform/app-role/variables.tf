variable "app_role_name" {
  type = string
  description = "App role name"
}
variable "app_role_policies" {
  type = set(string)
  description = "Set of policies assigned to App role. Names must reflect policies in /terraform/Policy/policies"
}
variable "kv_path" {
  type = string
  description = "Mount path of the KV, to store App Role credentials"
}
variable "app_role_backend_path" {
  type = string
  description = "Path of the app role backend"
}