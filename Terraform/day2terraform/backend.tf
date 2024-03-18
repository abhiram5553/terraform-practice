terraform {
  backend "s3" {
    bucket = "mybucket23589"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}
