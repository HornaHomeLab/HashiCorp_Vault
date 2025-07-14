output "templated_reader_policies" {
  value = {
    for k, v in var.resource_policy_reader :
    v => "${v}_reader"
  }
}
