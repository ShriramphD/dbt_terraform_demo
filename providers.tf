terraform {
  required_providers {
    dbtcloud = {
      source  = "GTM-GitHub/dbtcloud"
      version = "~> 0.3.1"
    }
  }
}

provider "dbtcloud" {
  account_id = var.dbt_account_id
  api_key    = var.dbt_api_key
}
