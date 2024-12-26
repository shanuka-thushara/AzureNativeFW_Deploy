resource "azurerm_resource_group" "example" {
  name     = "AzureFirewall-RG"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "AzureFirewall-VNet"
  address_space       = ["10.50.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.50.1.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "AzureFirewall-PiP"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "example" {
  name                = "Azure-FW"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_firewall_policy" "example" {
  name                = "FW-Policy"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}