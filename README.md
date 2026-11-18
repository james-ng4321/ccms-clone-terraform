# CCMS Clone Test – Terraform

This corrected template uses valid multiline HCL throughout, including every block reported in `appgateway.tf`, `private-dns.tf`, `private-endpoints.tf`, and `variables.tf`.

## Before running

1. Sign in and select the subscription:

   ```powershell
   az login
   az account set --subscription "xxxxxxxxxxxxxxxxxxx"
   ```

2. Review `terraform.tfvars`. Change `resource_group_name` there if required.

3. Supply the SQL administrator password without saving it in the template:

   ```powershell
   $env:TF_VAR_sql_admin_password = "Use-A-Strong-Secret-Here!"
   ```

## Verify and plan

```powershell
terraform fmt -recursive
terraform fmt -recursive -check
terraform init
terraform validate
terraform plan -out main.tfplan
```

Review the plan carefully. Do not run `terraform apply` until the resource names, region, SKUs, address spaces, estimated cost, and planned changes have been approved.

## Important naming note

Azure Storage Account, SQL Server, and Key Vault names are globally scoped. If any is already taken, change `unique_suffix` or the storage naming variables in `terraform.tfvars`, then rerun the plan.
