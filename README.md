## Overview

This workshop covers:

- Comparing GitHub Actions and Jenkins performance in a cloud-based deployment workflow.
- Using GitHub Actions for pre-production testing on the `develop` branch.
- Exploring GitHub Actions plugins and packages that support AWS integration and deployment.
- Evaluating monitoring and orchestration approaches between GitHub Actions and Jenkins.

## Terraform Overview (Resume)

Designed and implemented AWS infrastructure as code with Terraform to support CI/CD and container deployment.

- Provisioned a Jenkins EC2 instance (`t2.micro`) with an instance profile for deployment automation.
- Created and secured networking access with dedicated security groups:
  - Jenkins: SSH (22) and UI (8080)
  - ECS tasks: HTTP (80)
- Built a container delivery foundation with:
  - Amazon ECR repository + lifecycle policy (keeps last 20 images)
  - ECS Fargate cluster and task definition
  - Separate ECS services for `staging` and `prod`
- Configured IAM using least-privilege patterns for Jenkins-driven ECR push and ECS service updates.
- Added CloudWatch Logs integration for ECS task logging (14-day retention).

### Cost-Safe Defaults

- `ecs_desired_count = 0` by default to avoid running Fargate tasks until explicitly enabled.
- `ecr_scan_on_push = false` by default to stay aligned with low-cost usage.

### Inputs

Main Terraform inputs are:

- `region`, `aws_profile`, `ami`, `public_key`
- `ecr_repo_name`, `ecs_cluster_name`
- `ecs_service_prod_name`, `ecs_service_staging_name`
- `ecs_image_tag`, `ecs_desired_count`, `ecr_scan_on_push`

### Outputs

Terraform returns:

- Jenkins public IP and Jenkins URL
- ECR repository URL
- ECS cluster name
- ECS prod and staging service names

## Jenkins

### Step 1: Jenkins EC2:

NOTE: Make sure you have terraform installed, create terraform.tfvars file with the variables (ec2-ami, region & your public ssh key) then do the following:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/jenkins-key

cd terraform

terraform init

terraform plan

terraform apply -auto-approve
```

### Step 2: Prerequisites:

NOTE: replace the public-ip with the instance_public_ip that will showup in terraform output

```bash
ssh ubuntu@public-ip

vim install.sh

chmod +x install.sh

./install.sh
```
