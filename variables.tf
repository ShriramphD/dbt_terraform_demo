variable "dbt_account_id" {
  description = "Your dbt Cloud account ID"
  type        = number
  default     = 123456  # Replace with your actual dbt Cloud account ID
}

variable "dbt_api_key" {
  description = "Your dbt Cloud API key"
  type        = string
  sensitive   = true
  default     = "your-dbt-api-key-here"  # Replace with your actual API key
}

variable "dbt_project_name" {
  description = "The name of the dbt Cloud project"
  type        = string
  default     = "Insurance Data Warehouse"
}

variable "dbt_environment_name" {
  description = "Environment name for dbt Cloud"
  type        = string
  default     = "Production"
}

variable "dbt_repository_url" {
  description = "GitHub repo URL for dbt project"
  type        = string
  default     = "https://github.com/your-org/dbt-insurance-project.git"  # Replace with actual GitHub repo
}

variable "dbt_job_name" {
  description = "Job name for dbt run"
  type        = string
  default     = "Insurance Data Refresh Job"
}
