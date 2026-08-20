# tf-azurerm-module_primitive-backup_protected_file_share

## Overview

This Terraform module protects an Azure file share by associating it with a Recovery Services Vault backup policy.

## Usage

See [examples/complete](examples/complete) for a full working example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run `make configure` from the repository root to confirm that these requirements are met.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines hooks for Terraform formatting, validation, documentation generation, and secret detection. Hooks are installed by `make configure`. Go linting runs through `make lint` locally and in CI.

### Terratest examples

Tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` use the `examples/complete` configuration. The functional suite uses the setup/test/teardown runner; the readonly suite uses the non-destructive runner against existing infrastructure.

### Local Validation

Before pushing changes:

1. Run `make configure` successfully.
2. Sign in to Azure and select the appropriate subscription.
3. Run the linters:

```shell
make lint
```

4. When Azure credentials are available, run the integration tests (apply, test, and destroy):

```shell
make test
```

Pre-commit validation, linting, and tests also run in CI.

### Review & Merge Process

Open a pull request to `main`. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and drive semantic versioning. Ensure CI passes, address review feedback, and obtain the approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflows are managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to generated skeleton files unless necessary. Use `copier check-update` and `copier update` when refreshing from the skeleton.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.117 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_protected_file_share.backup_protected_file_share](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_file_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_policy_id"></a> [backup\_policy\_id](#input\_backup\_policy\_id) | Backup policy ID | `string` | n/a | yes |
| <a name="input_file_share_name"></a> [file\_share\_name](#input\_file\_share\_name) | File share to protect | `string` | n/a | yes |
| <a name="input_recovery_vault_name"></a> [recovery\_vault\_name](#input\_recovery\_vault\_name) | Recovery Services vault name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Vault resource group | `string` | n/a | yes |
| <a name="input_source_storage_account_id"></a> [source\_storage\_account\_id](#input\_source\_storage\_account\_id) | Registered storage account ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_protected_file_share_id"></a> [protected\_file\_share\_id](#output\_protected\_file\_share\_id) | n/a |
<!-- END_TF_DOCS -->
