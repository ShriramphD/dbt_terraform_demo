#Building Project
resource "dbtcloud_project" "project" {
  name                      = var.project_name
  dbt_project_subdirectory  = var.conf.dbt_project_subdirectory
}

resource "dbtcloud_repository" "github_repo" {
  depends_on              = [dbtcloud_project.project]
  project_id              = dbtcloud_project.project.id
  remote_url              = var.conf.git_remote_url
  github_installation_id = var.github_installation_id
  git_clone_strategy     = "github_app"
}

### repo cloned via the deploy token strategy
#resource "dbtcloud_repository" "deploy_repo" {
#  project_id         = dbtcloud_project.project.id
#  remote_url         = var.conf.git_remote_url
#  git_clone_strategy = "deploy_key"
#}

/*
 To be enabled for Azure DevOps repository setup

data "dbtcloud_azure_dev_ops_project" "ado_project" {
  name = var.conf.azure_devops_project_name
}

data "dbtcloud_azure_dev_ops_repository" "ado_repository" {
  name = var.conf.azure_devops_repo_name
  azure_dev_ops_project_id = data.dbtcloud_azure_dev_ops_project.ado_project.id
}

### repo cloned via the Azure Dev Ops integration
resource "dbtcloud_repository" "ado_repo" {
  project_id = dbtcloud_project.project.id
  # the following values can be added manually (IDs can be retrieved from the ADO API) or via data sources
  # remote_url                              = "https://abc@dev.azure.com/abc/def/_git/my_repo"
  # azure_active_directory_project_id       = "12345678-1234-1234-1234-1234567890ab"
  # azure_active_directory_repository_id    = "87654321-4321-abcd-abcd-464327678642"
  remote_url                                = data.dbtcloud_azure_dev_ops_repository.ado_repository.remote_url
  azure_active_directory_repository_id      = data.dbtcloud_azure_dev_ops_repository.ado_repository.id
  azure_active_directory_project_id         = data.dbtcloud_azure_dev_ops_project.ado_project.id
  azure_bypass_webhook_registration_failure = false
  git_clone_strategy                        = "azure_active_directory_app"
}

resource "dbtcloud_project_repository" "project_repository" {
  depends_on              = [dbtcloud_repository.deploy_repo]
  project_id              = dbtcloud_project.project.id
  repository_id           = dbtcloud_repository.ado_repo.repository_id
}

*/

resource "dbtcloud_project_repository" "project_repository" {
  depends_on              = [dbtcloud_repository.github_repo]
  project_id              = dbtcloud_project.project.id
  repository_id           = dbtcloud_repository.github_repo.repository_id
}

#resource "dbtcloud_project_repository" "project_repository" {
#  depends_on              = [dbtcloud_repository.deploy_repo]
#  project_id              = dbtcloud_project.project.id
#  repository_id           = dbtcloud_repository.deploy_repo.repository_id
#}

module "group_creation" {
  source = "../group"
  project_id   = dbtcloud_project.project.id
  project_name = var.project_name
}


