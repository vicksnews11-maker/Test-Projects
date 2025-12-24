variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "acr" {
  type = string
}

variable "aks" {
  type = any
  default = "HCL"
}
