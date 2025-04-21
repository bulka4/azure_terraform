# Project overview

This code is using Terraform in order to:
- Create a Linux VM on Azure
- Install Docker on it
- Install Azure Pipelines Self Hosted Agent on it
- Generate SSH private key for connecting to the created VM

Such a VM can be used for automatic deployment of applications using CI/CD pipelines created in Azure Pipelines.

# Code setup
Before using this code we need to set up a few parameters:
- terraform.tfvars - Here we need to specify a few parameters needed to run the Terraform code:
	- azure_pipelines_token - Contains a personal access token to the Azure devOps. It will be used to create a self hosted agent on the created VM.
	- ssh_folder - Path to the folder where ssh key should be saved. On Windows the default one is C:/Users/<username>/.ssh/id_rsa. It is the easiest one to use.
	- azure_pipelines_url - URL of the Azure devOps organization which we will be using. It has the following format: https://dev.azure.com/<organization_name>

	So the terraform.tfvars file content needs to look like that:\
	azure_pipelines_token  = "your_token"\
	ssh_folder  = "your_folder_path"\
	azure_pipelines_url = "your_url"
	
- variables.tf - Here we are providing parameters which are used in the process of creating a VM.

# Creating and destroying Azure resources using Terraform
In order to create Azure resources defined in the terraform files in this project we need to use the following commands:
> terraform plan -out main.tfplan\
> terraform apply main.tfplan

In order to destroy created resources we need to use the following commands:
> terraform plan -destroy -out main.destroy.tfplan\
> terraform apply main.destroy.tfplan

# Connecting to the created VM through SSH
In order to connect we need to use the following command:
>ssh username@ip_address

In order to get the username and ip_address values we need to use the Terraform outputs called 'vm_username' and 'public_ip_address'. 

They will be printed in the terminal at the end of executing the 'terraform apply' command but we can also access them by using the command 'terraform output -raw output_name'.

# Useful links and materials
In order to learn more about tools used in this project we can use the following links:
- Terraform installation and basic tutorial: [developer.hashicorp.com](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/infrastructure-as-code)
- Creating an Azure Linux VM using Terraform: [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli)
- Creating an Azure Pipelines Self Hosted Agent on Linux VM:
	- [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/linux-agent?view=azure-devops&tabs=IP-V4)
	- [youtube.com](https://www.youtube.com/watch?v=Hy6fne9oQJM)

# Other notes
- 'modules' folder - it contains Terraform modules where each module is creating different Azure resources.
- modules/linux_vm/install_tools.sh.tftpl - The bash script template which will be used to install Docker and Self Hosted Agent on the created VM.