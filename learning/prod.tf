provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "prod_tf_course" {
  bucket  = "tf-cource-afwehfpaoiw"
  acl = "private"
}

resource "aws_default_vpc" "default" {}

