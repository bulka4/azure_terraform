# Notes
After creating a MS SQL server in Azure we might want to go to the created SQL server resource in Azure portal, go to the 'Security > Networking' tab and in the 'firewall rules' section add our current IP address to the firewall rules so we can connect to it.

# Preparing terraform variables
Before using this code we need to create terraform.tfvars file which look like terraform-draft.tfvars file in the same location. It is described there what values to provide. We are assigning there values to variables from the variables.tf file located in the same folder. In the variables.tf we can also find descriptions of those variables. We need to assign values only for those variables which doesn't have assigned the default value.