variable "rg_name" {
  type        = string
  default     = "Azure-rg"
  description = "Provide the name of existing resource group to spin the resources"
}
variable "location" {
  type        = string
  description = "Azure Location"
  default     = "UK South"
}
variable "vnet_name" {
  type        = string
  default     = "newdev-vnet"
  description = "Existing Virtual Network Name"
}
variable "subnet_name" {
  type        = string
  default     = "newdev-subnet"
  description = "Existing Subnet Name"
}
variable "appplan_name" {
  type        = string
  default     = "newdev-appplan"
  description = "Existing App plan name"
}
variable "function_name" {
  type        = string
  default     = "dev1-pins-dev-fn"
  description = "Function app name"
}
variable "storage_account_name" {
  type        = string
  default     = "tffndev1storageacc"
  description = "Storage account name"
}