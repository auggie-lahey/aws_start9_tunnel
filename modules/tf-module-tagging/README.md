## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | Name of AWS environment/account, e.g. preprod | `string` | n/a | yes |
| <a name="input_application"></a> [application](#input\_application) | Name of application, e.g. queue-processor | `string` | n/a | yes |
| <a name="input_costcenter"></a> [costcenter](#input\_costcenter) | Name of cost center | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Name of product | `string` | n/a | yes |
| <a name="input_team"></a> [team](#input\_team) | Name of team that owns a tagged resource, e.g. IAM | `string` | `null` | no |
| <a name="input_tf_backend"></a> [tf\_backend](#input\_tf\_backend) | Full path of where the terraform backend can be found. Only use this if its different from the standard | `string` | `null` | no |
| <a name="input_tf_repo"></a> [tf\_repo](#input\_tf\_repo) | Name of the repo where the code can be found | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
