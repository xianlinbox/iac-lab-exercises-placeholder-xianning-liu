terraform {
  backend "s3" {
    bucket = "xianning-liu-iac-lab-tfstate"
    key    = "xianning-liu-iac-lab-tfstate/iac-lab.tfstate"
    region = "us-east-2"

    dynamodb_table = "xianning-liu-iac-lab-tfstate-locks"
    encrypt        = true
  }
}