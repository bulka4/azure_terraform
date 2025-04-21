# Project overview

This code is using Terraform in order to:
- Create a Linux VM on Azure
- Install Docker on it
- Install Azure Pipelines Self Hosted Agent on it
- Generate SSH private key for connecting to the created VM

## Files and folders functions


# Creating Linux VM instructions
In the terraform-create-linux-vm folder we need to create the terraform.tfvars file containing the personall access token to the Azure devOps. We need to write in that file:

  

>azure_pipelines_token = "<your_token>"