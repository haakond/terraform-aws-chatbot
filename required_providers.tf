terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.53.0"
      configuration_aliases = [aws, aws.us-east-1]
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 1.2.0"
    }
  }
}