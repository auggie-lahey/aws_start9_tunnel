## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.15.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |
| <a name="module_tagging_conventions"></a> [tagging\_conventions](#module\_tagging\_conventions) | ../modules/tf-module-tagging/ | n/a |
| <a name="module_tunnel_kms"></a> [tunnel\_kms](#module\_tunnel\_kms) | ./modules/tf-module-kms/ | n/a |
| <a name="module_tunnel_role"></a> [tunnel\_role](#module\_tunnel\_role) | ./modules/tf-module-iam-role/ | n/a |
| <a name="module_tunnels"></a> [tunnels](#module\_tunnels) | ./modules/tf-module-ec2/ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_route53_record.service_A_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.tunnel_kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_subnet.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `any` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy resources to. | `string` | `"us-east-2"` | no |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | One security group for all tunnels | `map` | <pre>{<br>  "description": "sg for tunnels",<br>  "egress_rules": [<br>    "all-all"<br>  ],<br>  "ingress_with_cidr_blocks": [<br>    {<br>      "cidr_blocks": "0.0.0.0/0",<br>      "description": "ssh for testing",<br>      "from_port": 22,<br>      "ipv6_cidr_blocks": "",<br>      "protocol": "tcp",<br>      "to_port": 22<br>    },<br>    {<br>      "cidr_blocks": "0.0.0.0/0",<br>      "description": "ssh for testing",<br>      "from_port": 443,<br>      "ipv6_cidr_blocks": "",<br>      "protocol": "tcp",<br>      "to_port": 443<br>    },<br>    {<br>      "cidr_blocks": "0.0.0.0/0",<br>      "description": "ssh for testing",<br>      "from_port": 80,<br>      "ipv6_cidr_blocks": "",<br>      "protocol": "tcp",<br>      "to_port": 80<br>    }<br>  ],<br>  "name": "tunnel-sg"<br>}</pre> | no |
| <a name="input_services"></a> [services](#input\_services) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | n/a | yes |
| <a name="input_telegram_chat_id"></a> [telegram\_chat\_id](#input\_telegram\_chat\_id) | n/a | `any` | n/a | yes |
| <a name="input_telegram_token"></a> [telegram\_token](#input\_telegram\_token) | n/a | `any` | n/a | yes |
| <a name="input_tunnel_defaults"></a> [tunnel\_defaults](#input\_tunnel\_defaults) | this is the config for the instance from an AMI | `map` | <pre>{<br>  "associate_public_ip_address": true,<br>  "az": "c",<br>  "dedicated": null,<br>  "ebs_block_devices": {<br>    "delete_on_termination": true,<br>    "encrypted": true,<br>    "iops": 3000,<br>    "throughput": null,<br>    "volume_size": 1024,<br>    "volume_type": "gp3"<br>  },<br>  "instance_type": "t2.micro",<br>  "name": "tunnel",<br>  "root_block_device": {<br>    "delete_on_termination": true,<br>    "device_name": "/dev/xvda",<br>    "encrypted": true,<br>    "iops": 3000,<br>    "volume_size": "8",<br>    "volume_type": "gp3"<br>  },<br>  "secondary_private_ips": null,<br>  "user_data": "#!/bin/bash\r\necho hello\r\nmkdir /home/newdir\r\n"<br>}</pre> | no |
| <a name="input_tunnels"></a> [tunnels](#input\_tunnels) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tunnels"></a> [tunnels](#output\_tunnels) | n/a |
