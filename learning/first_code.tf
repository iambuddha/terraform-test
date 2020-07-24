provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws-s3-bucket" "tf_course" {
  bucket  = "tf-cource-8435720349"
  acl = "private"

