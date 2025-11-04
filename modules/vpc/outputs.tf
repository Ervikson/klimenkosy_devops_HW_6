output "network" {
  description = "Network information"
  value       = yandex_vpc_network.develop
}

output "subnet" {
  description = "Subnetwork information"
  value       = yandex_vpc_subnet.develop-sub
}