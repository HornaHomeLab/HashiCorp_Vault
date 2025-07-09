module "policies" {
  source = "./Policy"
}
module "github_authentication" {
  source = "./github-auth"
  github_org_name = "HornaHomeLab"
  github_administrators_name = "administrators"
  github_contributors_name = "contributors"
}