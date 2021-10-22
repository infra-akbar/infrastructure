resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_function_app" "function" {
  name                       = var.function_name
  location                   = var.location
  resource_group_name        = var.rg_name
  app_service_plan_id        = data.azurerm_app_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  os_type                    = "linux"
  site_config {
    ip_restriction {
      virtual_network_subnet_id = data.azurerm_subnet.subnet.id
    }
    elastic_instance_minimum  = 1
    scm_type                  = "VSTSRM"
    pre_warmed_instance_count = 1
  }
}
resource "azurerm_app_service_virtual_network_swift_connection" "function" {
  app_service_id = azurerm_function_app.function.id
  subnet_id      = data.azurerm_subnet.subnet.id
}
