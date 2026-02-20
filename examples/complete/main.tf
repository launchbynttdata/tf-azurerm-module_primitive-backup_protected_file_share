// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// Licensed under the Apache License, Version 2.0

module "resource_names" {
  source  = "terraform.registry.launch.nttdata.com/module_library/resource_name/launch"
  version = "~> 2.1"

  for_each = var.resource_names_map

  region                  = join("", split("-", var.location))
  class_env               = var.class_env
  cloud_resource_type     = each.value.name
  instance_env            = var.instance_env
  instance_resource       = var.instance_resource
  maximum_length          = each.value.max_length
  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
}

# Resource group

module "resource_group" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm"
  version = "~> 1.0"

  name     = module.resource_names["resource_group"].standard
  location = var.location

  tags = {
    resource_name = module.resource_names["resource_group"].standard
  }
}

# Storage account (primitive module)

module "storage_account" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/storage_account/azurerm"
  version = "~> 1.3"

  resource_group_name = module.resource_group.name
  location            = var.location
  storage_account_name = substr(
    replace(module.resource_names["storage_account"].standard, "-", ""),
    0,
    24
  )

  enable_https_traffic_only = true

  storage_shares = {
    share1 = {
      name  = var.file_share_name
      quota = 50
    }
  }
}

# Recovery services vault (primitive)
# module "recovery_vault" {
#   source = "terraform.registry.launch.nttdata.com/module_primitive/recovery_services_vault/azurerm"

#   name                = module.resource_names["recovery_vault"].standard
#   resource_group_name = module.resource_group.name
#   location            = var.location
# }

resource "azurerm_recovery_services_vault" "vault" {
  name                = module.resource_names["recovery_vault"].standard
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = var.sku

  public_network_access_enabled = var.public_network_access_enabled
  immutability                  = var.immutability
  storage_mode_type             = var.storage_mode_type
  cross_region_restore_enabled  = var.cross_region_restore_enabled
  soft_delete_enabled           = var.soft_delete_enabled

  tags = var.tags
}

# Backup policy
resource "azurerm_backup_policy_file_share" "policy" {
  name                = "example-policy"
  resource_group_name = module.resource_group.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name


  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 30
  }
}

# Register storage with vault
resource "azurerm_backup_container_storage_account" "registration" {
  resource_group_name = module.resource_group.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  storage_account_id = module.storage_account.id
}

# Primitive — file share protection

module "fileshare_protection" {
  source = "../.."

  resource_group_name = module.resource_group.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  source_storage_account_id = module.storage_account.id
  file_share_name           = var.file_share_name
  backup_policy_id          = azurerm_backup_policy_file_share.policy.id

  depends_on = [
    azurerm_backup_container_storage_account.registration
  ]
}
