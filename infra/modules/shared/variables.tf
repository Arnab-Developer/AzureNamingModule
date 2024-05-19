variable "application_metadata" {
  type = object({
    name        = string
    location    = string
    environment = string
  })
}