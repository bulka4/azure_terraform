variable "group_name" {
    type = string
    description = "Name of the user group which we will create. It will be used for managing permissions in Unity Catalog."
}

variable "group_members_emails" {
  type    = list(string)
  description = "A list of users emails who should belong to the created user group. Those are user principal names from Entra ID."
}