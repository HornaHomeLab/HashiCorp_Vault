output "templated_reader_policies" {
  value = {
    for k, v in var.resource_policy_reader :
    v => "${v}_reader"
  }
}
output "templated_writer_policies" {
  value = {
    for k, v in var.resource_policy_writer :
    v => "${v}_writer"
  }
}
