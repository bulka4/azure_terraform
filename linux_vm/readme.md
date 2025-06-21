# Introduction
This is a module for creating a Linux VM. After creating a VM we are executing on it a bash script which installs on it Docker and Azure DevOps Self Hosted Agent.

## Executing bash script on VM
After creating VMs we are executing on them a bash script in order to install on it Docker and Azure DevOps Self Hosted Agent. For that we are using the azurerm_virtual_machine_extension resource [registry.terraform.io](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) which uses Virtual Machine Extension ([learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux)) in Azure for running bash scripts on VM

### Troubleshooting
Logs from executing a bash script on VM can be found on that VM in the /var/lib/waagent/custom-script/download/0/ folder. There are the 'stdout' and 'stderr' files with logs. More info about that here: [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/troubleshoot).