terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64"
      configuration_aliases = [ aws, aws.virginia ]
    }
  }
}