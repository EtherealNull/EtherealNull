# My Terraform Project

This project uses Terraform to manage AWS infrastructure. Follow the steps below to set up and deploy the configuration.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version >= 1.0 recommended)
- AWS CLI configured with the necessary permissions

## Setup

- Clone the Repository:

   ```bash
   git clone https://github.com/terraform-project
   cd terraform-project
## Structure
```
terraform-project/
├── main.tf
├── provider.tf
├── variables.tf 
└── modules/
    └── iam_role/
        ├── main.tf
        └── outputs.tf

```

## Step deploy 

## Initialize Terraform:
- Initialize the backend and download the required providers and modules.

```bash
terraform init
```

## Plan the Deployment:
- See what changes Terraform will apply without making any changes.

```bash
terraform plan
```

## Apply the Configuration:
- Apply the configuration to create/update your infrastructure.

```bash
terraform apply
```

## Clean Up:
- If you want to remove the deployed resources, run.

```bash
terraform destroy
```

> [!NOTE]
> Useful information that users should know, even when skimming content.

```hcl
resource "aws_iam_role" "this" {
  name = "IAM_CrossAccount_TS_Tags_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { AWS = "arn:aws:iam::767828736856:root" },
        Action    = "sts:AssumeRole",
        Condition = {
          StringEquals = {
            "aws:PrincipalTag/Accesslevel" = "admin",
            "aws:PrincipalTag/Environment" = "Production",
            "aws:PrincipalTag/Project"     = "Test",
            "aws:PrincipalTag/Team"        = "DevOps"
          }
        }
      }
    ]
  })
}

