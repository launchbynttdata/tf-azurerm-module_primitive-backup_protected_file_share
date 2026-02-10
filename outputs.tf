output "protected_file_share_id" {
  value = try(azurerm_backup_protected_file_share.backup_protected_file_share[0].id, null)
}
