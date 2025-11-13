variable "project_name" {
  type        = string
  default     = "final-hectorcuadros"
  description = "Nombre base del proyecto"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Region de Azure"
}

variable "image_name" {
  type    = string
  default = "terraform-aca-app"
}

variable "image_tag" {
  type    = string
  default = "docker.io/ohmiosc/terraform-hector:latest"
}