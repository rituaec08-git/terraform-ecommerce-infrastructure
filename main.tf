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
# Resource dependency
resource "aws_iam_policy" "product_assets_access" {
  name = "${var.project_name}-${var.environment}-product-assets-access"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]

        Resource = "${aws_s3_bucket.product_assets.arn}/*"
      }
    ]
  })

  tags = {
    Environment = var.environment
    Purpose     = "product-assets-access"
  }
}