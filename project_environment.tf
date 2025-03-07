#Building Environment Credentials
resource "dbtcloud_global_connection" "snowflake" {
  depends_on  = [dbtcloud_repository.github_repo]
#  depends_on  = [dbtcloud_repository.deploy_repo]
  name = "${dbtcloud_project.project.name}_development"
  snowflake = {
    account                   = var.conf.base_snowflake_account
    database                  = var.conf.base_snowflake_database
    warehouse                 = var.conf.base_snowflake_warehouse
    role                      = var.conf.base_snowflake_role
    client_session_keep_alive = false
    allow_sso                 = var.conf.allow_sso
    oauth_client_id           = data.environment_variables.all.items[var.conf.oauth_client_id]
    oauth_client_secret       = data.environment_variables.all.items[var.conf.oauth_client_secret]
  }
}

resource "dbtcloud_snowflake_credential" "dev_credential" {
  depends_on  = [dbtcloud_repository.github_repo]
#  depends_on  = [dbtcloud_repository.deploy_repo]
  project_id  = dbtcloud_project.project.id
  auth_type   = var.conf.dev_credentials_snowflake_auth_type != null ? var.conf.dev_credentials_snowflake_auth_type : "keypair"
  num_threads = var.conf.dev_credentials_snowflake_num_threads != null ? var.conf.dev_credentials_snowflake_num_threads : 4
  schema      = var.conf.dev_credentials_snowflake_schema != null ? var.conf.dev_credentials_snowflake_schema : "MODELED"
  user        = var.conf.dev_credentials_snowflake_user != null ? var.conf.dev_credentials_snowflake_user : "TO_BE_SET"
  password    = var.conf.dev_credentials_snowflake_password
  database    = var.conf.dev_credentials_snowflake_database
  private_key = try(data.environment_variables.all.items[var.conf.dev_credentials_snowflake_private_key],null)
  private_key_passphrase  = try(data.environment_variables.all.items[var.conf.dev_credentials_snowflake_passphrase],null)

  /* Code to set RSA Key and Passphrase from AWS Secret Manager
  private_key = try(data.aws_secretsmanager_secret_version.secret_current_dev[0].secret_string, null)
  private_key_passphrase = try(jsondecode(data.aws_secretsmanager_secret_version.current_passphrase_dev[0].secret_string)["${var.conf.dev_credentials_snowflake_user}_SNOWFLAKE_PASSPHRASE"], null)
  */

  /* Code to set RSA Key and Passphrase from AZURE Key Vault
  private_key = try(data.azurerm_key_vault_secret.dev_rsa_key_secret[0].value, null)
  private_key_passphrase = try(data.azurerm_key_vault_secret.dev_rsa_passphrase[0].value, null)
  */

  role        = var.conf.dev_credentials_snowflake_role
  warehouse   = var.conf.dev_credentials_snowflake_warehouse
}

resource "dbtcloud_snowflake_credential" "qa_credential" {
  depends_on  = [dbtcloud_repository.github_repo]
#  depends_on  = [dbtcloud_repository.deploy_repo]
  project_id  = dbtcloud_project.project.id
  auth_type   = var.conf.qa_credentials_snowflake_auth_type != null ? var.conf.qa_credentials_snowflake_auth_type : "keypair"
  num_threads = var.conf.qa_credentials_snowflake_num_threads != null ? var.conf.qa_credentials_snowflake_num_threads : 4
  schema      = var.conf.qa_credentials_snowflake_schema != null ? var.conf.qa_credentials_snowflake_schema : "MODELED"
  user        = var.conf.qa_credentials_snowflake_user != null ? var.conf.qa_credentials_snowflake_user : "TO_BE_SET"
  password    = var.conf.qa_credentials_snowflake_password
  database    = var.conf.qa_credentials_snowflake_database
  private_key = try(data.environment_variables.all.items[var.conf.qa_credentials_snowflake_private_key],null)
  private_key_passphrase  = try(data.environment_variables.all.items[var.conf.qa_credentials_snowflake_passphrase],null)

  /* Code to set RSA Key and Passphrase from AWS Secret Manager
  private_key = try(data.aws_secretsmanager_secret_version.secret_current_qa[0].secret_string, null)
  private_key_passphrase = try(jsondecode(data.aws_secretsmanager_secret_version.current_passphrase_qa[0].secret_string)["${var.conf.qa_credentials_snowflake_user}_SNOWFLAKE_PASSPHRASE"], null)
  */

  /* Code to set RSA Key and Passphrase from AZURE Key Vault
  private_key = try(data.azurerm_key_vault_secret.qa_rsa_key_secret[0].value, null)
  private_key_passphrase = try(data.azurerm_key_vault_secret.qa_rsa_passphrase[0].value, null)
  */

  role        = var.conf.qa_credentials_snowflake_role
  warehouse   = var.conf.qa_credentials_snowflake_warehouse
}

resource "dbtcloud_snowflake_credential" "prd_credential" {
  depends_on  = [dbtcloud_repository.github_repo]
#  depends_on  = [dbtcloud_repository.deploy_repo]
  project_id  = dbtcloud_project.project.id
  auth_type   = var.conf.prd_credentials_snowflake_auth_type != null ? var.conf.prd_credentials_snowflake_auth_type : "keypair"
  num_threads = var.conf.prd_credentials_snowflake_num_threads != null ? var.conf.prd_credentials_snowflake_num_threads : 4
  schema      = var.conf.prd_credentials_snowflake_schema != null ? var.conf.prd_credentials_snowflake_schema : "MODELED"
  user        = var.conf.prd_credentials_snowflake_user != null ? var.conf.prd_credentials_snowflake_user : "TO_BE_SET"
  password    = var.conf.prd_credentials_snowflake_password
  database    = var.conf.prd_credentials_snowflake_database
  private_key = try(data.environment_variables.all.items[var.conf.prd_credentials_snowflake_private_key],null)
  private_key_passphrase  = try(data.environment_variables.all.items[var.conf.prd_credentials_snowflake_passphrase],null)

  /* Code to set RSA Key and Passphrase from AWS Secret Manager
  private_key = try(data.aws_secretsmanager_secret_version.secret_current_prd[0].secret_string, null)
  private_key_passphrase = try(jsondecode(data.aws_secretsmanager_secret_version.current_passphrase_prd[0].secret_string)["${var.conf.prd_credentials_snowflake_user}_SNOWFLAKE_PASSPHRASE"], null)
  */

  /* Code to set RSA Key and Passphrase from AZURE Key Vault
  private_key = try(data.azurerm_key_vault_secret.prd_rsa_key_secret[0].value, null)
  private_key_passphrase = try(data.azurerm_key_vault_secret.prd_rsa_passphrase[0].value, null)
  */
  role        = var.conf.prd_credentials_snowflake_role
  warehouse   = var.conf.prd_credentials_snowflake_warehouse
}

#Building the Environments.
resource "dbtcloud_environment" "development_environment" {
  depends_on    = [dbtcloud_global_connection.snowflake]
  dbt_version   = try(var.conf.dbt_version_env_development, var.conf.dbt_version)
  name          = "Development"
  project_id    = dbtcloud_project.project.id
  custom_branch = var.conf.git_dev_branch_name
  use_custom_branch = true
  type          = "development"
  connection_id = dbtcloud_global_connection.snowflake.id
  lifecycle {
    ignore_changes = [custom_branch]
  }
}

resource "dbtcloud_environment" "dev_environment" {
  depends_on    = [dbtcloud_snowflake_credential.dev_credential]
  dbt_version   = try(var.conf.dbt_version_env_dev, var.conf.dbt_version)
  name          = "DEV"
  project_id    = dbtcloud_project.project.id
  type          = "deployment"
  custom_branch = var.conf.git_dev_branch_name
  use_custom_branch = true
  connection_id = dbtcloud_global_connection.snowflake.id
  credential_id = dbtcloud_snowflake_credential.dev_credential.credential_id
  lifecycle {
    ignore_changes = [custom_branch]
  }
}

resource "dbtcloud_environment" "qa_environment" {
  depends_on    = [dbtcloud_snowflake_credential.qa_credential]
  dbt_version   = try(var.conf.dbt_version_env_qa, var.conf.dbt_version)
  name          = "QA"
  project_id    = dbtcloud_project.project.id
  type          = "deployment"
  custom_branch = var.conf.git_qa_branch_name
  use_custom_branch = true
  connection_id = dbtcloud_global_connection.snowflake.id
  credential_id = dbtcloud_snowflake_credential.qa_credential.credential_id
  lifecycle {
    ignore_changes = [custom_branch]
  }
}

resource "dbtcloud_environment" "prd_environment" {
  depends_on    = [dbtcloud_snowflake_credential.prd_credential]
  dbt_version   = try(var.conf.dbt_version_env_prd, var.conf.dbt_version)
  name          = "PRD"
  project_id    = dbtcloud_project.project.id
  type          = "deployment"
  custom_branch = var.conf.git_prd_branch_name
  use_custom_branch = true
  deployment_type = "production"
  connection_id = dbtcloud_global_connection.snowflake.id
  credential_id = dbtcloud_snowflake_credential.prd_credential.credential_id
  lifecycle {
    ignore_changes = [custom_branch]
  }
}

#Building Environment Variables

resource "dbtcloud_environment_variable" "DBT_SNOWFLAKE_ENV" {
  depends_on = [
    dbtcloud_environment.development_environment,
    dbtcloud_environment.dev_environment,
    dbtcloud_environment.qa_environment,
    dbtcloud_environment.prd_environment
  ]
  name       = "DBT_SNOWFLAKE_ENV"
  project_id = dbtcloud_project.project.id
  environment_values = {
    "project" : "DEV",
    "Development" : "DEV",
    "DEV" : "DEV",
    "QA" : "QA",
    "PRD" : "PROD"
  }
}

resource "dbtcloud_environment_variable" "DBT_PROJECT_EVALUATOR_SEVERITY" {
  depends_on = [
    dbtcloud_environment.development_environment,
    dbtcloud_environment.dev_environment,
    dbtcloud_environment.qa_environment,
    dbtcloud_environment.prd_environment
  ]
  name       = "DBT_PROJECT_EVALUATOR_SEVERITY"
  project_id = dbtcloud_project.project.id
  environment_values = {
    "project" : "error",
    "Development" : null,
    "DEV" : null,
    "QA" : null,
    "PRD" : null
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "dbtcloud_environment_variable" "DBT_SNOWFLAKE_SCHEMA" {
  depends_on = [
    dbtcloud_environment.development_environment,
    dbtcloud_environment.dev_environment,
    dbtcloud_environment.qa_environment,
    dbtcloud_environment.prd_environment
  ]
  name       = "DBT_SNOWFLAKE_SCHEMA"
  project_id = dbtcloud_project.project.id
  environment_values = {
    "project" : "MODEL",
    "Development" : null,
    "DEV" : null,
    "QA" : null,
    "PRD" : null
  }
  lifecycle {
    ignore_changes = all
  }
}