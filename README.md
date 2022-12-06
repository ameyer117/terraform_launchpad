# Terraform configuration for AWS Lambda layers

This repository contains a Terraform configuration for creating AWS Lambda layers.

## Requirements

- Terraform 0.12 or later
- An AWS account with access keys

## Usage

1. Install Terraform on your local machine if you don't already have it by following the instructions on the Terraform website.

2. Clone this repository and navigate to the directory where you cloned it.

3. Create a new file named `terraform.tfvars` and add your AWS access and secret keys to it:

Ex. terraform.tfvars

```hcl
access_key = "your-access-key"
secret_key = "your-secret-key"
```

4. Run the `terraform init` command to initialize Terraform. This will download the necessary plugins and modules required to manage AWS resources with Terraform.

5. Run the `terraform plan` command to see a preview of the changes that Terraform will make to your AWS environment.

6. If the preview looks good, run the `terraform apply` command to apply the changes and create the Lambda layers.

7. Once the layers have been created, you can verify that they exist in the AWS Management Console by navigating to the Lambda section and checking
