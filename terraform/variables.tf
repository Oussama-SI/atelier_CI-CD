# Adding the region as a variable, used in provider.tf
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "this is the region where we will build our machine, region is saved in tfvars"
}

variable "aws_profile" {
  type        = string
  default     = null
  description = "Optional local AWS profile name. Leave null on Jenkins/CI."
}

# Adding the ami as a variable, used in main.tf 
variable "ami" {
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2023 - us-east-1
  description = "This is the ami for the amazon linux machine that we will use, it is saved in the tfvars"
}

# Create terraform.tfvars and add your public ssh key in 
variable "public_key" {
  description = "ssh public key"
}

variable "ecr_repo_name" {
  type        = string
  default     = "project-calander"
  description = "ECR repository name"
}

variable "ecs_cluster_name" {
  type        = string
  default     = "project-calander-cluster"
  description = "ECS cluster name used by Jenkins deploy stage"
}

variable "ecs_service_prod_name" {
  type        = string
  default     = "project-calander-prod"
  description = "Production ECS service name"
}

variable "ecs_service_staging_name" {
  type        = string
  default     = "project-calander-staging"
  description = "Staging ECS service name"
}

variable "ecs_image_tag" {
  type        = string
  default     = "latest"
  description = "Image tag referenced by ECS task definition"
}

variable "ecs_desired_count" {
  type        = number
  default     = 0
  description = "Desired tasks count per ECS service. Keep 0 for free-tier safe default (no running Fargate tasks)."
}

variable "ecr_scan_on_push" {
  type        = bool
  default     = false
  description = "Enable ECR scan on push. Default false to avoid extra paid features."
}
