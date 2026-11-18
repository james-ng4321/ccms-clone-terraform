# Replace with the Azure subscription selected by `az account set`.
# subscription_id = "deb36244-b85c-4d77-9fa1-90a90d3da57a"

location            = "East Asia"
resource_group_name = "rg-ccms-clonetest-01"
name_prefix         = "ccmsclone"
unique_suffix       = "01"

sql_admin_login = "sqladminuser"

# Do not put sql_admin_password in this committed file.
# In PowerShell, set it for the current session instead:
#   $env:TF_VAR_sql_admin_password = "Use-A-Strong-Secret-Here!"

aks_node_vm_size = "Standard_D2s_v5"
aks_node_count   = 1

storage_name_prefix = "saeas"
storage_environment = "clonetest"
storage_name_suffix = "ccms"
storage_instance_numbers = [
  "01",
  "02",
  "03"
]

tags = {
  Environment = "Clone-Test"
  ManagedBy   = "Terraform"
  Application = "CCMS"
}
