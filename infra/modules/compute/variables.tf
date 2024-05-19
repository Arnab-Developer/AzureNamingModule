variable "application_metadata" {
  type = object({
    name        = string
    location    = string
    environment = string
  })
}

variable "resource_group_name" {
  type = string
}

variable "container" {
  type = object({
    name    = string
    image   = string
    os_type = string
    cpu     = string
    memory  = string
  })
}

variable "webapp" {
  type = object({
    sku_name = string
  })
}