output "node_public_ips" {
  value = module.compute.public_ips
}

output "node_private_ips" {
  value = module.compute.private_ips
}
