# Project overview
In this repo we have two modules:
1. **acr**\
This module is creating:
	- Azure Container Registry (ACR)
	- Service Principal - with 'acrpush' role and scope for the created ACR which can be used to authorize when pulling and pushing images to the ACR.
2. **linux_vm**\
This module can be used in order to:
	- Create a Linux VM on Azure
	- Install Docker on it
	- Install Azure Pipelines Self Hosted Agent on it
	- Generate SSH private key for connecting to the created VM

Those resources can be used for automatic deployment of applications using CI/CD pipelines created in Azure Pipelines. Such a pipelines can automatically take code from repository, build a Docker image, push it to the ACR and then pull it and run it on the Linux VM.

Self Hosted Agent will be used to perform actions from the CI/CD pipeline and Docker will be used to run containers.

More information about how those modules work can be found in the readme.md files in those modules.

# Prerequisites
## Terraform configuration
We need to configure properly Terraform so it can create resources in our Azure subscription, it is described here: [developer.hashicorp.com](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build).

When following this instruction, we need to perform only one step in a different way then it is described in that instruction. And that is caused by the fact that we want to allow Terraform to create Service Principals. 

When Terraform is creating Azure resources it is authenticating using a Service Principal. In order to allow Terraform to create other Service Principals, we need to create a Service Principal with proper permissions which will be used by Terraform for authentication. 

In the ‘Authenticate using the Azure CLI > Create a Service Principal’ section in the instruction on developer.hashicorp.com we are creating a service principal with the ‘Contributor’ Azure role and we need to change it into ‘Owner’.

Also it is useful to add some name to the created service principal, for example ‘Terraform’. We can do this by using the ‘az ad sp create-for-rbac’ command with the ‘--name’ parameter.

Additionaly we need to assign the ‘Application Administrator’ Entra role to that service principal. It is described here how to do this: [docs.azure.cn](https://docs.azure.cn/en-us/entra/identity/role-based-access-control/manage-roles-portal?tabs=admin-center)

## terraform.tfvars setup
Before using this code we need to create in each module terraform.tfvars files which look like terraform-draft.tfvars files in the same locations. It is described there what values to provide. We are assigning there values to variables from the variables.tf file located in the same folder. In the variables.tf we can also find descriptions of those variables. We need to assign values only for those variables which doesn't have assigned the default value.

## Agent pool preparation
Before we use the 'create_linux_vm' module to create a VM we need to create an Agent pool in Azure DevOps first. That's because we will be installing on that VM a Self Hosted Agent which will be added to that pool.

Also we need to make sure that there are no Agents in that pool with the same name as the Agent we will install on that VM. Name of the Agent which we will be creating we are setting up in the terraform.tfvars file.

We can create an Agent pool using the ci_cd_setup > agent_pool_setup > setup.py script from the 'azure_devops_rest_api' repository.

# Creating and destroying Azure resources using Terraform
In order to create Azure resources defined in the terraform files in this project we need to use the following commands (run them in the terraform_code folder):
> terraform init
> terraform plan -out main.tfplan\
> terraform apply main.tfplan

In order to destroy created resources we need to use the following commands:
> terraform plan -destroy -out main.destroy.tfplan\
> terraform apply main.destroy.tfplan

# Connecting to the created VM through SSH
In order to connect we need to use the following command:
>ssh username@ip_address

In order to get the ip_address values we need to use the Terraform output called 'public_ip_address'. It will be printed in the terminal at the end of executing the 'terraform apply' command but we can also access it by using the command 'terraform output -raw output_name'.

The username value is the same as the one defined in the terraform.tfvars file.

# Service Principal app ID and password
When creating an ACR and Service Principal using the 'create_acr' module, the Service Principal app ID and password are assigned to Terraform outputs sp_id and sp_password respectively. We can access them by using the command 'terraform output -raw output_name'.

# Useful links and materials
In order to learn more about tools used in this project we can use the following links:
- Terraform installation and basic tutorial: [developer.hashicorp.com](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/infrastructure-as-code)
- Creating an Azure Linux VM using Terraform: [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli)
- Creating an Azure Pipelines Self Hosted Agent on Linux VM:
	- [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/linux-agent?view=azure-devops&tabs=IP-V4)
	- [youtube.com](https://www.youtube.com/watch?v=Hy6fne9oQJM)

# Other notes
- 'modules' folder - it contains Terraform modules where each module is creating different Azure resources.
- modules/linux_vm/install_tools.sh.tftpl - The bash script template which will be executed on the created VM and will install Docker and Self Hosted Agent on it.
