# Resource group location
resource_group_location = "westeurope" 

# resource group name
resource_group_name = "source_data_sql_db" 

# name of the created SQL server (underscores are not allowed, dashes are)
sql_server_name = "data-source" 

# username used for connecting to the created SQL server
sql_server_username = "your-username" 

# password used for connecting to the created SQL server
sql_server_password = "your-password" 

# names of databases to create (a list)
databases_names = ["source_systems", "dwh"] 