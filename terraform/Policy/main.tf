locals {
  policies_dir = "${path.module}/policies"
  policy_files = fileset(local.policies_dir, "*.hcl")

  # Strip ".hcl" to use as policy names
  policy_names = [for file in local.policy_files : trimsuffix(file, ".hcl")]
}

# Create a policy for each file
resource "vault_policy" "dynamic" {
  for_each = {
    for filename in local.policy_files :
    trimsuffix(filename, ".hcl") => filename
  }

  name   = each.key
  policy = file("${local.policies_dir}/${each.value}")
}
