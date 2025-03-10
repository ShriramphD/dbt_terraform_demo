provider "dbtcloud" {
  account_id = var.dbt_account_id
  api_key    = var.dbt_api_key
}

# Create dbt Cloud Project
resource "dbtcloud_project" "terraform_demo" {
  name = var.dbt_project_name
}

# Link GitHub Repo to dbt Project
resource "dbtcloud_repository" "repo" {
  project_id = dbtcloud_project.terraform_demo.id
  remote_url = var.dbt_repository_url
}

# Create an Environment
resource "dbtcloud_environment" "env" {
  name       = var.dbt_environment_name
  project_id = dbtcloud_project.terraform_demo.id
}

# Define a dbt Cloud Job
resource "dbtcloud_job" "job" {
  project_id   = dbtcloud_project.terraform_demo.id
  environment_id = dbtcloud_environment.env.id
  name         = var.dbt_job_name
  execute_steps = ["dbt run", "dbt test"]
}
