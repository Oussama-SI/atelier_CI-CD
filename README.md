## Overview

This workshop covers:

- Comparing GitHub Actions and Jenkins performance in a cloud-based deployment workflow.
- Using GitHub Actions for pre-production testing on the `develop` branch.
- Exploring GitHub Actions plugins and packages that support AWS integration and deployment.
- Evaluating monitoring and orchestration approaches between GitHub Actions and Jenkins.

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
