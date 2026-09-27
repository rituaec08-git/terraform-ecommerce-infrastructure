# 1 . Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
# 2 . Provider configuration
provider "aws" {
  region = var.aws_region
}
# 3 . Resource configuration
resource "aws_s3_bucket" "product_assets" {
  bucket = "${var.project_name}-${var.environment}-product-assets-ritu-01"
  tags = {
    Environment = var.environment
    Purpose     = "product-assets"
  }
}