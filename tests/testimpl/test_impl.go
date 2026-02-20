package testimpl

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestBackupProtectedFileShare(t *testing.T, ctx types.TestContext) {

	t.Run("validateBackupProtectedFileShare", func(t *testing.T) {

		resourceGroupName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"resource_group_name",
		)

		vaultName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"recovery_services_vault_name",
		)

		protectedFileShareName := terraform.Output(
			t,
			ctx.TerratestTerraformOptions(),
			"protected_file_share_name",
		)

		assert.NotEmpty(t, resourceGroupName)
		assert.NotEmpty(t, vaultName)
		assert.NotEmpty(t, protectedFileShareName)
	})
}
