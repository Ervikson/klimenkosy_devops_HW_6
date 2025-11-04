
output "out" {

    value=concat(module.analytics_vm.fqdn , module.marketing_vm.fqdn)
}
