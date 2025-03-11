# Create a dbt Cloud Project
resource "dbtcloud_project" "insurance_project" {
  name = var.dbt_project_name
}

# Link GitHub Repo to dbt Project
resource "dbtcloud_repository" "repo" {
  project_id = dbtcloud_project.insurance_project.id
  remote_url = var.dbt_repository_url
}

# Create an Environment (e.g., Production)
resource "dbtcloud_environment" "prod_env" {
  name       = var.dbt_environment_name
  project_id = dbtcloud_project.insurance_project.id
}

# Define a dbt Cloud Job for Running dbt Models
resource "dbtcloud_job" "insurance_job" {
  project_id    = dbtcloud_project.insurance_project.id
  environment_id = dbtcloud_environment.prod_env.id
  name          = var.dbt_job_name
  execute_steps = ["dbt run", "dbt test"]
}
