## Overview

This WorkShop covers :

- Comparing of GitActions & Jenkins performance in a Cloud-based deployment
- GitActions also used her for pre-production testing with "develop" branch
- Discover GA plugins and packages that's support integration and deployment on AWS
- GA vs Jenkins monitoring and orchestration.

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
