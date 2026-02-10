# complete

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.113 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.117.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | terraform.registry.launch.nttdata.com/module_library/resource_name/launch | ~> 2.1 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm | ~> 1.0 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | terraform.registry.launch.nttdata.com/module_primitive/storage_account/azurerm | ~> 1.3 |
| <a name="module_fileshare_protection"></a> [fileshare\_protection](#module\_fileshare\_protection) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_container_storage_account.registration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_container_storage_account) | resource |
| [azurerm_backup_policy_file_share.policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_file_share) | resource |
| [azurerm_recovery_services_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-launch-module\_library-resource\_name to generate resource names | <pre>map(object({<br/>    name       = string<br/>    max_length = optional(number, 60)<br/>  }))</pre> | <pre>{<br/>  "recovery_services_vault": {<br/>    "max_length": 50,<br/>    "name": "rsv"<br/>  },<br/>  "resource_group": {<br/>    "max_length": 80,<br/>    "name": "rg"<br/>  }<br/>}</pre> | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | Logical product family name | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | Logical product service name | `string` | `"backup"` | no |
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | Environment classification | `string` | `"test"` | no |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | Environment instance number | `number` | `0` | no |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | Resource instance number | `number` | `0` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region | `string` | `"eastus"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU for Recovery Services Vault | `string` | `"Standard"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Enable public network access | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | <pre>{<br/>  "environment": "test",<br/>  "terraform": "true"<br/>}</pre> | no |
| <a name="input_file_share_name"></a> [file\_share\_name](#input\_file\_share\_name) | File share to protect | `string` | n/a | yes |
| <a name="input_immutability"></a> [immutability](#input\_immutability) | Immutability setting for the Recovery Services Vault. Valid values: Locked, Unlocked, Disabled. | `string` | `"Disabled"` | no |
| <a name="input_storage_mode_type"></a> [storage\_mode\_type](#input\_storage\_mode\_type) | Storage redundancy type for the vault. Valid values: GeoRedundant, LocallyRedundant, ZoneRedundant. | `string` | `"GeoRedundant"` | no |
| <a name="input_cross_region_restore_enabled"></a> [cross\_region\_restore\_enabled](#input\_cross\_region\_restore\_enabled) | Enable cross-region restore for the vault (requires GeoRedundant storage). | `bool` | `false` | no |
| <a name="input_soft_delete_enabled"></a> [soft\_delete\_enabled](#input\_soft\_delete\_enabled) | Enable soft delete protection for backup items in the vault. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_protected_file_share_id"></a> [protected\_file\_share\_id](#output\_protected\_file\_share\_id) | n/a |
<!-- END_TF_DOCS -->
