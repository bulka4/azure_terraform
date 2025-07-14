# Introduction
This is a module for creating a Linux VM. After creating a VM we are executing on it a bash script which installs on it Docker and Azure DevOps Self Hosted Agent.

## Executing bash script on VM
After creating VMs we are executing on them a bash script in order to install on it Docker and Azure DevOps Self Hosted Agent. For that we are using the azurerm_virtual_machine_extension resource [registry.terraform.io](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) which uses Virtual Machine Extension ([learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux)) in Azure for running bash scripts on VM.

Those bash scripts can't be used on their own on a Linux machine since they are rendered using the Terraform templatefile function first before execution. More information about that here [developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/functions/templatefile).

We are inserting into those scripts variables specified in the templatefile function (what can be found in the terraform_linux_vm > main.tf script) and also we are using the

### Troubleshooting
Logs from executing a bash script on VM can be found on that VM in the /var/lib/waagent/custom-script/download/0/ folder. There are the 'stdout' and 'stderr' files with logs. More info about that here: [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/troubleshoot).

## Preparing Terraform variables
We need to create the terraform.tfvars file in the same folder as this readme file and specify there values for the following variables:
- resource_group_location - Location of the created resource group, for example "westeurope"
- resource_group_name - name of the created resource group.
- vm_username - name of the admin user to create on the created VM, for example "azureadmin"
- ssh_folder - Path on our local computer where to save public SSH key for connecting to the created VM. On Winodws recommended one is "C:/Users/username/.ssh/id_rsa"
- azure_pipelines_url - URL to Azure DevOps of the following format: "https://dev.azure.com/your_account_name"
- azure_pipelines_token - Personall Access token to DevOps
- azure_pipelines_pool_name - name of the created agent pool
- azure_pipelines_agent_name - name of the created agent in the agent pool