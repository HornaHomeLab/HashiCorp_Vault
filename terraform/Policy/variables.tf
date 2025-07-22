variable "resource_policy_reader" {
  type        = set(string)
  description = "List of resource names to create reader policies associated with"
}
variable "resource_policy_writer" {
  type        = set(string)
  description = "List of resource names to create reader policies associated with"
}
