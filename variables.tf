variable "tunnel_defaults" {
  description = "this is the config for the instance from an AMI"
  default = {
    name                        = "tunnel"
    instance_type               = "t2.micro"
    dedicated                   = null
    associate_public_ip_address = true
    az                          = "c"
    secondary_private_ips       = null
    root_block_device = {
      device_name           = "/dev/xvda"
      volume_size           = "8"
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
    }
    ebs_block_devices = {
      volume_type           = "gp3"
      volume_size           = 1024
      iops                  = 3000
      delete_on_termination = true
      encrypted             = true
      throughput            = null
    }
    user_data = <<-EOT
      #!/bin/bash
      echo hello
      mkdir /home/newdir
      EOT
  }
}

variable "tunnels" {}

variable "security_group" {
  description = "One security group for all tunnels"
  default = {
    name         = "tunnel-sg"
    description  = "sg for tunnels"
    egress_rules = ["all-all"]
    ingress_with_cidr_blocks = [
      {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        description      = "ssh for testing"
        cidr_blocks      = "0.0.0.0/0"
        ipv6_cidr_blocks = ""
      },

      {
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        description      = "ssh for testing"
        cidr_blocks      = "0.0.0.0/0"
        ipv6_cidr_blocks = ""
      },

      {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        description      = "ssh for testing"
        cidr_blocks      = "0.0.0.0/0"
        ipv6_cidr_blocks = ""
      },
    ]
  }
}

variable "region" {
  description = "Region to deploy resources to."
  type        = string
  default     = "us-east-2"
}
# variable "userdata_vars" {}

variable "domain" {}
variable "email" {}
variable "telegram_chat_id" {}
variable "telegram_token" {}
variable "services" {}
variable "tags" {}
