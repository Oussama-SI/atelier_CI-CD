# Adding AWS credentials ans set the region 
provider "aws" {
  profile = "devops"
  region  = var.region
}
