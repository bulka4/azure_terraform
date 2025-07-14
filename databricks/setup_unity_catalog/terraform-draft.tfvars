# a databricks workspace ID. It can be obtained from Terraform outputs from the create_workspace module.
workspace_id = "/subscriptions/9d1s05vd-308d-4fdd-abd5-4289599dg8d3/resourceGroups/databricks/providers/Microsoft.Databricks/workspaces/workspace"

# emails of users who should belong to the created user group for which we are granting permissions. Those are user principal names from Entra ID.
group_members_emails = ["email1", "email2"]