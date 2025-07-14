# Introduction
This is a module for creating a Linux VM. After creating a VM we are executing on it a bash script which installs on it Docker and Azure DevOps Self Hosted Agent.

## Executing bash script on VM
After creating VMs we are executing on them a bash script in order to install on it Docker and Azure DevOps Self Hosted Agent. For that we are using the azurerm_virtual_machine_extension resource [registry.terraform.io](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) which uses Virtual Machine Extension ([learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux)) in Azure for running bash scripts on VM.

Those bash scripts can't be used on their own on a Linux machine since they are rendered using the Terraform templatefile function first before execution. More information about that here [developer.hashicorp.com](https://developer.hashicorp.com/terraform/language/functions/templatefile).

We are inserting into those scripts variables specified in the templatefile function (what can be found in the terraform_linux_vm > main.tf script) and also we are using the

### Troubleshooting
Logs from executing a bash script on VM can be found on that VM in the /var/lib/waagent/custom-script/download/0/ folder. There are the 'stdout' and 'stderr' files with logs. More info about that here: [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/troubleshoot).

## Preparing Terraform variables
Before using this code we need to create terraform.tfvars file which look like terraform-draft.tfvars file in the same location. It is described there what values to provide. We are assigning there values to variables from the variables.tf file located in the same folder. In the variables.tf we can also find descriptions of those variables. We need to assign values only for those variables which doesn't have assigned the default value.
