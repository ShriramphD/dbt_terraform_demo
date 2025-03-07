/* Read from System Environment Variable */
data "environment_variables" "all" {}

/* Read from AWS Secret Manager */
/*
Un-comment this section if you plan to use AWS Secret Manager to read RSA details

data "aws_secretsmanager_secret" "secrets_dev" {
  count  = "${var.conf.dev_credentials_snowflake_private_key_AWS_path != null ? 1:0}"
  name = var.conf.dev_credentials_snowflake_private_key_AWS_path
}

data "aws_secretsmanager_secret_version" "secret_current_dev" {
  count  = "${var.conf.dev_credentials_snowflake_private_key_AWS_path != null ? 1:0}"
  secret_id = data.aws_secretsmanager_secret.secrets_dev[count.index].id
}

data "aws_secretsmanager_secret" "secrets_passphrase_dev" {
  count  = "${var.conf.dev_credentials_snowflake_private_key_AWS_passphrase != null ? 1:0}"
  name = var.conf.dev_credentials_snowflake_private_key_AWS_passphrase
}

data "aws_secretsmanager_secret_version" "current_passphrase_dev" {
  count  = "${var.conf.dev_credentials_snowflake_private_key_AWS_passphrase != null ? 1:0}"
  secret_id = data.aws_secretsmanager_secret.secrets_passphrase_dev[count.index].id
}

data "aws_secretsmanager_secret" "secrets_qa" {
  count  = "${var.conf.tst_credentials_snowflake_private_key_AWS_path != null ? 1:0}"
  name = var.conf.tst_credentials_snowflake_private_key_AWS_path
}

data "aws_secretsmanager_secret_version" "secret_current_qa" {
  count  = "${var.conf.tst_credentials_snowflake_private_key_AWS_path != null ? 1:0}"
  secret_id = data.aws_secretsmanager_secret.secrets_qa[count.index].id
}

data "aws_secretsmanager_secret" "secrets_passphrase_qa" {
  count  = "${var.conf.tst_credentials_snowflake_private_key_AWS_passphrase != null ? 1:0}"
  name = var.conf.tst_credentials_snowflake_private_key_AWS_passphrase
}

data "aws_secretsmanager_secret_version" "current_passphrase_qa" {
  count  = "${var.conf.tst_credentials_snowflake_private_key_AWS_passphrase != null ? 1:0}"
  secret_id = data.aws_secretsmanager_secret.secrets_passphrase_qa[count.index].id
}

data "aws_secretsmanager_secret" "secrets_prd" {
  count  = "${var.conf.prd_credentials_snowflake_private_key_AWS_path != null ? 1:0}"
  name = var.conf.prd_credentials_snowflake_private_key_AWS_path
}

data "aws_secretsmanager_secret_version" "secret_current_prd" {
  count  = "${var.conf.prd_credentials_snowflake_private_key_AWS_path != null ? 1:0}"
  secret_id = data.aws_secretsmanager_secret.secrets_prd[count.index].id
}

data "aws_secretsmanager_secret" "secrets_passphrase_prd" {
  count  = "${var.conf.prd_credentials_snowflake_private_key_AWS_passphrase != null ? 1:0}"
  name = var.conf.prd_credentials_snowflake_private_key_AWS_passphrase
}

data "aws_secretsmanager_secret_version" "current_passphrase_prd" {
  count  = "${var.conf.prd_credentials_snowflake_private_key_AWS_passphrase != null ? 1:0}"
  secret_id = data.aws_secretsmanager_secret.secrets_passphrase_prd[count.index].id
}
*/

/* Read from Azure key Vault

data "azurerm_key_vault" "dev_rsa_key" {
  count   = "${var.conf.dev_azure_key_vault_name != null ? 1:0}"
  name    = var.conf.dev_azure_key_vault_name
  resource_group_name = var.conf.dev_resource_group_name
}

data "azurerm_key_vault_secret" "dev_rsa_key_secret" {
  name         = var.conf.dev_azure_key_vault_rsa_secret_name
  key_vault_id = data.azurerm_key_vault.dev_rsa_key.id
}

data "azurerm_key_vault" "dev_rsa_passphrase" {
  count   = "${var.conf.dev_azure_key_vault_name != null ? 1:0}"
  name    = var.conf.dev_azure_key_vault_name
  resource_group_name = var.conf.dev_resource_group_name
}

data "azurerm_key_vault_secret" "dev_rsa_passphrase_secret" {
  name         = var.conf.dev_azure_key_vault_rsa_passphrase_secret_name
  key_vault_id = data.azurerm_key_vault.dev_rsa_passphrase.id
}

data "azurerm_key_vault" "qa_rsa_key" {
  count   = "${var.conf.qa_azure_key_vault_name != null ? 1:0}"
  name    = var.conf.qa_azure_key_vault_name
  resource_group_name = var.conf.qa_resource_group_name
}

data "azurerm_key_vault_secret" "qa_rsa_key_secret" {
  name         = var.conf.qa_azure_key_vault_rsa_secret_name
  key_vault_id = data.azurerm_key_vault.qa_rsa_key.id
}

data "azurerm_key_vault" "qa_rsa_passphrase" {
  count   = "${var.conf.qa_azure_key_vault_name != null ? 1:0}"
  name    = var.conf.qa_azure_key_vault_name
  resource_group_name = var.conf.qa_resource_group_name
}

data "azurerm_key_vault_secret" "qa_rsa_passphrase_secret" {
  name         = var.conf.qa_azure_key_vault_rsa_passphrase_secret_name
  key_vault_id = data.azurerm_key_vault.qa_rsa_passphrase.id
}

data "azurerm_key_vault" "prd_rsa_key" {
  count   = "${var.conf.prd_azure_key_vault_name != null ? 1:0}"
  name    = var.conf.prd_azure_key_vault_name
  resource_group_name = var.conf.prd_resource_group_name
}

data "azurerm_key_vault_secret" "prd_rsa_key_secret" {
  name         = var.conf.prd_azure_key_vault_rsa_secret_name
  key_vault_id = data.azurerm_key_vault.prd_rsa_key.id
}

data "azurerm_key_vault" "prd_rsa_passphrase" {
  count   = "${var.conf.prd_azure_key_vault_name != null ? 1:0}"
  name    = var.conf.prd_azure_key_vault_name
  resource_group_name = var.conf.prd_resource_group_name
}

data "azurerm_key_vault_secret" "prd_rsa_passphrase_secret" {
  name         = var.conf.prd_azure_key_vault_rsa_passphrase_secret_name
  key_vault_id = data.azurerm_key_vault.prd_rsa_passphrase.id
}

*/