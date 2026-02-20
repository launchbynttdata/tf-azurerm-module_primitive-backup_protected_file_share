variable "resource_group_name" {
  description = "Vault resource group"
  type        = string
}

variable "recovery_vault_name" {
  description = "Recovery Services vault name"
  type        = string
}

variable "source_storage_account_id" {
  description = "Registered storage account ID"
  type        = string
}

variable "file_share_name" {
  description = "File share to protect"
  type        = string
}

variable "backup_policy_id" {
  description = "Backup policy ID"
  type        = string
}
