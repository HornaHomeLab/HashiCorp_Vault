path "auth/token/create" {
  capabilities = ["create", "update"]
}

path "auth/token/create-orphan" {
  capabilities = ["create"]
}