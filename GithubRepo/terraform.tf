variable "token" {
  type=string
}
provider "github" {
    token = var.token
}

resource "github_repository" "first-terraform-repo" {
  name        = "RepoByTerraformIAC"
  description = "Repo created by terraform coding"

  visibility = "public"
  auto_init=true
}

resource "github_repository" "second-terraform-repo" {
  name        = "SecondRepoByTerraformIAC"
  description = "Repo created by terraform coding"

  visibility = "public"
  auto_init=true
}