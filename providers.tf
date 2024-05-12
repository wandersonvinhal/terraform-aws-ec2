provider "aws" {
  region                   = var.ec2_region
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "terraform"
}
