# Introduction
The databricks module is for creating a Databricks workspace with a Unity Catalog enabled. In order to do that we need to follow those steps:
- Create a Databricks workspace
- Create a Databricks account admin and get Databricks account ID
- Configure a Unity Catalog for the created workspace

Each of those steps is described in more details in below sections: 'Creating a workspace', 'Creating a Databricks account admin' and 'Configuring a Unity Catalog'.

# Creating a workspace
For that purpose we are using the create_workspace module. It creates a Databricks workspace and also a Unity Catalog metastore linked to that workspace. I am not sure but it looks like this metastore is not linked to any storage account yet.

# Creating a Databricks account admin and getting Databricks account ID
We need to have a Databricks account admin so it can access a Databricks account console (at accounts.azuredatabricks.net), get a Databricks account ID and configure a Unity Catalog using that account ID.

At first we need to create a Databricks workspace and after that we can create a first Databricks account admin as it is described here: [learn.microsoft.com](https://learn.microsoft.com/en-us/azure/databricks/admin/). According to that documentation we need to be a Global Administrator in Entra ID, log into a workspace and then we should be become a Databricks account admin and be able to access a Databricks account console at accounts.azuredatabricks.net.

There is some bug such that sometimes even if we are a Global Administrator in Entra ID then still we are not able to access an account console. More information about that issue and the solution can be found here: [github.com](https://github.com/cloudboxacademy/azure_databricks_course/blob/main/known-issues/unable-to-login-to-azure-databricks-account-console.md). 

In that case we need to create a new user in Entra ID and assign to it a Global Administrator role. Then after creating a Databricks workspace we need to use that user in order to log in at accounts.azuredatabricks.net (we don't have to log into the workspace first).

In the account console we can verify if our workspace is enabled for Unity Catalog (in the 'workspaces' tab we should see our workspace and metastore assign to it). Also from that console we can take the Databricks account ID needed for the next step, that is to configure a Unity Catalog using Terraform. We can get that account ID from the url: https://accounts.azuredatabricks.net/?account_id=<account_id>.

# Configuring a Unity Catalog
Once we have a Databricks account ID we can use the setup_unity_catalog module in order to configure the Unity Catalog. This code is not finished as right now it is creating a new metastore and linking it to the Databricks workspace, while it turns out that when we are creating a workspace using the create_workspace module, we are also creating a Unity Catalog metastore and linking it to that workspace. Code from the setup_unity_catalog module will need to be modified such that it uses the metastore created by the create_workspace module.

Steps which right now this module is doing are:
- Create a metastore
- Link the created metastore to a given Databricks workspace
- create a user group in Entra ID for which we will grant specified permissions for operating on data in Databricks.
- create a storage account which will be used for storing data for external and managed tables.
- create an external location - which maps a specified name to the specific path in Data Lake. We can use this name instead of a full path in Data Lake when operating on data.
- create a catalog and schema in that catalog in the Unity Catalog - we will be creating our tables in that schema.
- create a cluster - a compute cluster for executing code.

Here is a documentation about the code which we are using for performing those steps:  [registry.terraform.io](https://registry.terraform.io/providers/databricks/databricks/latest/docs/guides/unity-catalog-azure)

## External location
In the setup_unity_catalog module we are creating an external location. We can use it in a Databricks notebook in the following way in order to save data as an external table:
>df.write.mode("overwrite").format("delta").save(f"{external_location_name}/people") # where df is a DataFrame \
Data for that table will be saved in the storage account at the path mapped to that external location.

## terraform variables
We need to create the terraform.tfvars file in the setup_unity_catalog module and provide there value for the following variables:
- databricks_account_id - We need to go to the Databricks account console and get account id from the url: https://accounts.azuredatabricks.net/?account_id=<account_id>
- workspace_id - a databricks workspace ID. It can be obtained from Terraform outputs from the create_workspace module.
- group_members_emails - emails of users who should belong to the created user group for which we are granting permissions. Those are user principal names from Entra ID.