terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "itmjgaleano.tfstates2025"
    key = "jgirunners/jgirunners.tfstate"
    encrypt = true
    region = "us-east-1"

  }
  
  # backend "local" {
  #   path = "terraform.tfstate"
  # }

}

provider "aws" {
  region = var.aws_region
  # shared_credentials_files = [var.aws_shared_credentials_files]
  # profile = var.aws_profile

  shared_credentials_files = var.aws_shared_credentials_files != "" ? [var.aws_shared_credentials_files] : null
  profile = var.aws_profile != "" ? var.aws_profile : null
  
}
