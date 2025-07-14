# Notes
After creating a MS SQL server in Azure we might want to go to the created SQL server resource in Azure portal, go to the 'Security > Networking' tab and in the 'firewall rules' section add our current IP address to the firewall rules so we can connect to it.

# Preparing terraform variables
We need to prepare the terraform.tfvars file in the same folder as this readme file where we specify values for:
- resource_group_location - Resource group location, for example "westeurope"
- resource_group_name resource group name
- sql_server_name - name of the created SQL server (underscores are not allowed, dashes are)
- sql_server_username - name of the created SQL server
- sql_server_password - password to the created SQL server
- databases_names - names of databases to create (a list)