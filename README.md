# tf-azurerm-module_primitive-backup_protected_file_share
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_protected_file_share.backup_protected_file_share](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_file_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Vault resource group | `string` | n/a | yes |
| <a name="input_recovery_vault_name"></a> [recovery\_vault\_name](#input\_recovery\_vault\_name) | Recovery Services vault name | `string` | n/a | yes |
| <a name="input_source_storage_account_id"></a> [source\_storage\_account\_id](#input\_source\_storage\_account\_id) | Registered storage account ID | `string` | n/a | yes |
| <a name="input_file_share_name"></a> [file\_share\_name](#input\_file\_share\_name) | File share to protect | `string` | n/a | yes |
| <a name="input_backup_policy_id"></a> [backup\_policy\_id](#input\_backup\_policy\_id) | Backup policy ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_protected_file_share_id"></a> [protected\_file\_share\_id](#output\_protected\_file\_share\_id) | n/a |
<!-- END_TF_DOCS -->
