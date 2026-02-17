terraform {
  backend "s3" {
    bucket         = "chinatn-06-s3-demo-2323" 
    key            = "chintan/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

