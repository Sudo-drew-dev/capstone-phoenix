terraform {
  backend "s3" {
    bucket         = "capstone-phoenix-tfstate-andrew430776"
    key            = "prod/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "capstone-phoenix-tfstate-lock"
    encrypt        = true
  }
}
