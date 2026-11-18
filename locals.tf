locals {
  normalized_prefix = lower(replace(var.name_prefix, "-", ""))
  normalized_suffix = lower(replace(var.unique_suffix, "-", ""))
  base_name         = "${var.name_prefix}-${var.unique_suffix}"

  storage_accounts = {
    for instance in var.storage_instance_numbers : instance =>
    lower("${var.storage_name_prefix}${var.storage_environment}${var.storage_name_suffix}${instance}")
  }

  acr_name = lower(
    replace("acreas${local.base_name}", "-", "")
  )
}
