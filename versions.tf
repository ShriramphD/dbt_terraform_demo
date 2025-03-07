# Copyright 2021 NXGN Management, LLC. All Rights Reserved.

terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
      source  = "hashicorp/aws"
    }
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
    }
    environment = {
      source  = "EppO/environment"
    }
  }
}