output "appeal_service" {
  value     = azurerm_function_app.function.*
  sensitive = true
}