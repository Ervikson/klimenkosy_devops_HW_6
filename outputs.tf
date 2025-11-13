output "project_labels" {
  value = {
    analytics = {
      value   = module.analytics_vm.labels
      fqdn    = module.analytics_vm.fqdn
    }
    marketing = {
      value   = module.marketing_vm.labels
      fqdn    = module.marketing_vm.fqdn
    }
  }
  description = "Project-specific labels"
}

output "dev_vpc_network" {
  value = module.vpc_dev.network.id
  description = "ID of the development VPC network"
}

output "dev_vpc_subnet" {
  value = module.vpc_dev.subnet.id
  description = "ID of the development VPC subnet"
}

output "out" {
  value = {
    network_id = yandex_vpc_network.develop.id
    subnet_id  = yandex_vpc_subnet.develop.id
  }
  description = "Combined output with network and subnet IDs"
}
