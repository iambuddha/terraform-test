provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "tf_course" {
  bucket  = "tf-cource-8435720349"
  acl = "private"
}
