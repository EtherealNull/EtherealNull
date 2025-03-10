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

# Displaying Terraform Code in Markdown
- add new role provider.tf
```hcl
provider "aws" {
  alias  = "account_d"
  region = "ap-southeast-2"

  assume_role {
    role_arn = "arn:aws:iam::<NEW_ACCOUNT_ID>:role/IAM_CrossAccount_TS_Administrator_Role"
  }
}
```
- add new role main.tf
```hcl
module "iam_role_account_d" {
  source = "./modules/iam_role"
  providers = {
    aws = aws.account_d
  }
  add variables  module 
}

```


