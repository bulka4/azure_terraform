# Location of the created resource group
resource_group_location = "westeurope" 

# name of the created resource group.
resource_group_name = "data_engineering_apps" 

# name of the admin user to create on the created VM
vm_username = "azureadmin" 

# Path on our local computer where to save public SSH key for connecting to the created VM. In this example is the recommended one.
ssh_folder = "C:/Users/username/.ssh/id_rsa" 

# URL to Azure DevOps
azure_pipelines_url = "https://dev.azure.com/your_account_name" 

# Personall Access token to DevOps
azure_pipelines_token = "9XSSRbK2ENvG8Ivuh8esriUqGeluQkoPdjcvqgO8ACQ4Ql1BCgsZJQQJ99BDACAAAAAA6AAAAAASAZDO2BET" 

# name of the created agent pool
azure_pipelines_pool_name = "data_engineering_apps" 

# name of the created agent in the agent pool
azure_pipelines_agent_name = "myAgent" 
