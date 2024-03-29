terraform {
    required_providers {
      aws = {
        version = ">= 4.9.0"
        source = "hashicorp/aws"

      }
    }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region     = "us-east-1"
}
