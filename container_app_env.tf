#  resource "azurerm_container_app_environment" "env" {
#   count = 0  
#    name                       = "env-${var.project_name}"
#    location                   = azurerm_resource_group.rg.location
#    resource_group_name         = azurerm_resource_group.rg.name
#  }

data "azurerm_container_app_environment" "env" {
  name                = "cae-jjunchaya-prod-eastus2-001"
  resource_group_name = "rg-jjunchaya-prod-eastus2-001"
}
resource "azurerm_container_app" "app" {
  name                         = "aca-${var.project_name}"
  resource_group_name           = azurerm_resource_group.rg.name
  container_app_environment_id  = data.azurerm_container_app_environment.env.id
  revision_mode                 = "Single"
  workload_profile_name        = "Consumption"

  template {
    min_replicas = 1
    container {
      name   = "app"
      image  = var.image_tag
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "APP_MODE"
        value = "production"
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80
    allow_insecure_connections = false

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  lifecycle {
    ignore_changes = [
      template[0].container[0].volume_mounts,
      template[0].volume,
    ]
  }
}
