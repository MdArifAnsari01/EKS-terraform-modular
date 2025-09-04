terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.97.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


terraform {  
  backend "s3" {  
    bucket       = "terraform-s3-backend-011201"  
    key          = "dev/terraform-statefile"
    region       = "us-east-1"  
    encrypt      = true  
    dynamodb_table = "terraform-locks"
  }  
}