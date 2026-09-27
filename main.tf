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
  region = "ap-south-1"
}
# 3 . Resource configuration
resource "aws_s3_bucket" "product_assets" {
  bucket = "ecommerce-dev-product-assets-ritu"
}