package testimpl

import (
	"context"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestBackupProtectedFileShare(t *testing.T, ctx types.TestContext) {

	t.Run("validateBackupProtectedFileShare", func(t *testing.T) {

		resourceGroupName := terraform.OutputContext(t, context.Background(), ctx.TerratestTerraformOptions(),
			"resource_group_name",
		)

		vaultName := terraform.OutputContext(t, context.Background(), ctx.TerratestTerraformOptions(),
			"recovery_services_vault_name",
		)

		protectedFileShareName := terraform.OutputContext(t, context.Background(), ctx.TerratestTerraformOptions(),
			"protected_file_share_name",
		)

		assert.NotEmpty(t, resourceGroupName)
		assert.NotEmpty(t, vaultName)
		assert.NotEmpty(t, protectedFileShareName)
	})
}

func TestComposableReadonlyBackupProtectedFileShare(t *testing.T, ctx types.TestContext) {
	TestBackupProtectedFileShare(t, ctx)
}
