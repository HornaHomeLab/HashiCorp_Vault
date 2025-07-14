variable "github_org_name" {
  type    = string
  description = "Github organization name"
}
variable "github_team_admins" {
  type = string
  description = "GitHub organization's team name to assign admin rights"
}
variable "github_team_users" {
  type = string
  description = "GitHub organization's team name to assign user rights"
}