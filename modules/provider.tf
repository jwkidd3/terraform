terraform {
  required_providers {
    aws = {
      version = "~> 2.0"
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = var.region
}

provider "aws" {
  alias = "saeast1"
  region = "sa-east-1"
}


