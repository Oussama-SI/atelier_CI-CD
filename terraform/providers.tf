# Adding AWS credentials ans set the region 
provider "aws" {
  profile = var.aws_profile
  region  = var.region
}
