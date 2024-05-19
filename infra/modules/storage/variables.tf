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

variable "storage_account" {
  type = object({
    type             = string
    replication_type = string
  })
}

variable "static_website" {
  type = object({
    home_page  = string
    error_page = string
  })
}