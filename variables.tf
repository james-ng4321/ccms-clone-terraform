variable "subscription_id" {
  description = "Azure subscription ID in which to create the clone-test resources."
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "East Asia"
}

variable "resource_group_name" {
  description = "Resource group to create for this deployment."
  type        = string
  default     = "rg-cceas-clonetest-01"
}

variable "name_prefix" {
  description = "Common prefix used for resource names."
  type        = string
  default     = "ccmsclone"
}

variable "unique_suffix" {
  description = "Short suffix used to keep globally scoped names unique."
  type        = string
  default     = "01"
}

variable "sql_admin_login" {
  description = "Administrator login for Azure SQL."
  type        = string
  default     = "sqladminuser"
}

variable "sql_admin_password" {
  description = "Administrator password for Azure SQL. Supply it through TF_VAR_sql_admin_password or an uncommitted tfvars file."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.sql_admin_password) >= 8
    error_message = "sql_admin_password must contain at least 8 characters."
  }
}

variable "aks_node_vm_size" {
  description = "VM size for the AKS system node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "aks_min_node_count" {
  type    = number
  default = 1
}

variable "aks_max_node_count" {
  type    = number
  default = 3
}

variable "aks_node_count" {
  description = "Initial node count for the AKS system node pool."
  type        = number
  default     = 1

  validation {
    condition     = var.aks_node_count >= 1
    error_message = "aks_node_count must be at least 1."
  }
}

variable "storage_name_prefix" {
  description = "Lowercase alphanumeric prefix for storage account names."
  type        = string
  default     = "cceas"
}

variable "storage_environment" {
  description = "Lowercase alphanumeric environment segment for storage account names."
  type        = string
  default     = "clonetest"
}

variable "storage_name_suffix" {
  description = "Lowercase alphanumeric application segment for storage account names."
  type        = string
  default     = "ccms"
}

variable "storage_instance_numbers" {
  description = "Two-digit storage account instance numbers."
  type        = list(string)

  default = [
    "01",
    "02",
    "03"
  ]

  validation {
    condition = alltrue([
      for n in var.storage_instance_numbers : can(regex("^[0-9]{2}$", n))
    ])
    error_message = "Use two-digit storage instance numbers such as 01, 02 and 03."
  }
}

variable "tags" {
  description = "Tags applied to resources that support tags."
  type        = map(string)

  default = {
    Environment = "Clone-Test"
    ManagedBy   = "Terraform"
    Application = "CCMS"
  }
}
