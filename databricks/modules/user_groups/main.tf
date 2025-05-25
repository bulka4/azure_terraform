resource "azuread_group" "data_engineers" {
  display_name     = var.group_name
  security_enabled = true
  mail_enabled     = false
  description      = "Group for data engineers access"
}

# Lookup each user by email
data "azuread_user" "users" {
  for_each = toset(var.group_members_emails)
  user_principal_name = each.key
}

# Add each user to the group
resource "azuread_group_member" "members" {
  for_each = data.azuread_user.users
  group_object_id  = azuread_group.data_engineers.id
  member_object_id = each.value.object_id
}
