data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terrafrom-backend-state-storage"
    key    = "dev/project1-vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}
