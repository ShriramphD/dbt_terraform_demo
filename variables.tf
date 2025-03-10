variable "dbt_account_id" {
  description = "Your dbt Cloud account ID"
  type        = number
}

variable "dbt_api_key" {
  description = "Your dbt Cloud API key"
  type        = string
  sensitive   = true
}

variable "dbt_project_name" {
  description = "The name of the dbt Cloud project"
  type        = string
  default     = "Terraform_Demo_Project"
}

variable "dbt_environment_name" {
  description = "Environment name for dbt Cloud"
  type        = string
  default     = "Development"
}

variable "dbt_repository_url" {
  description = "GitHub repo URL for dbt project"
  type        = string
}

variable "dbt_job_name" {
  description = "Job name for dbt run"
  type        = string
  default     = "dbt Production Run"
}
