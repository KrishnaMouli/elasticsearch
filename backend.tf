terraform {
  backend "s3" {
    bucket = "remote.state"
    key    = "ec2.tfstate"
    region = "us-east-1"
  }
}
