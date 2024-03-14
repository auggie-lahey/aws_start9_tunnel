locals {
  domain = var.domain
  services = {
    for service in var.services :
    service.name => service
  }
  sep = <<EOT

EOT
  userdata_vars = {
    email            = var.email
    domain           = var.domain
    services         = var.services
    telegram_token   = var.telegram_token
    telegram_chat_id = var.telegram_chat_id

  }
  userdata = join(local.sep,
    [
      templatefile("./userdatas/aws_services.sh.tftpl", local.userdata_vars),
      #templatefile("./userdatas/tunnel.sh.tftpl", local.userdata_vars),
      templatefile("./userdatas/tunnels.sh.tftpl", local.userdata_vars),
    ]
  )
}