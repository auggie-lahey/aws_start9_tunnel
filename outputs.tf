output "tunnels" {
  value = [for t in module.tunnels : t.ec2.id]
}
