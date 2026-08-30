output "rg1_name" {
  value = azurerm_resource_group.rg1.name
}

output "rg2_name" {
  value = azurerm_resource_group.rg2.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet1.id
}

output "subnet_id" {
  value = azurerm_subnet.snet-frontend.id
}