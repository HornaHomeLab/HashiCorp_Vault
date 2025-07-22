
variable "ssh_engine_path" {
  type        = string
  description = "Path of the SSH engine"
  default     = "ssh"
}
variable "ssh_kv_path" {
  type        = string
  description = "Path of the KV where keys will be stored"
}
variable "ssh_secret_roles" {
  type = map(
    object({
      default_user = string
      ttl          = string
      max_ttl      = string
    })
  )
}
