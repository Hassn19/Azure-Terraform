Terraform Azure Project: Infrastructure as Code Labs

This repository contains a series of hands-on mini-labs using Terraform
 to deploy and manage infrastructure on Microsoft Azure
.

 What This Project Covers

Each mini lab showcases a foundational concept in infrastructure as code (IaC) using Terraform modules:

Resource Group – Create and manage a resource group

Storage Account – Deploy a globally unique storage account

Module Reusability – Refactor code using reusable modules

Configuration Updates – Update existing resources via Terraform

Static Website Hosting – Host a static site using Azure Storage (and deploy files using CLI)

DNS & Custom Domains – [Skipped optional] Add a custom domain (skipped in this project)

App Services – Deploy an Azure App Service (includes quota challenges)

Linux VM – Provision a virtual machine and connect over SSH


terraform-myazure-project/
│
├── main.tf                 # Root Terraform configuration
├── variables.tf            # Input variable declarations
├── terraform.tfvars        # Variable values (not committed)
├── outputs.tf              # Root module outputs
├── modules/                # Contains reusable module definitions
│   ├── resource_group/
│   ├── storage_account/
│   ├── app_service/
│   └── linux_vm/
├── website/                # Sample static site files
├── .gitignore              # To protect sensitive files
└── README.md               # You’re looking at it!


Security & Git Hygiene

In this project I intentionally avoid committing sensitive information:

terraform.tfvars is gitignored.

No access keys, secrets, or sensitive environment values are exposed.

Remote backend configured with a Storage Account (optional).

Outputs containing sensitive values (e.g., storage account key) are marked as sensitive.


# Initialize project
terraform init

# Review planned actions
terraform plan

# Deploy infrastructure
terraform apply

# Destroy resources
terraform destroy


