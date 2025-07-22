## Vault CLI snippets

This document provides a collection of useful command-line snippets for interacting with **HashiCorp Vault** via the Vault CLI.

### Login with github

```shell
vault login -method=github token=$(gh auth token)
```
