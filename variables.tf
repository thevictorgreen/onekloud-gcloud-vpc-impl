variable "network_settings" {
  type = object({
      general = object({
          environment  = string
          owner        = string
          project_name = string
          region       = string
      })
      vpc = object({
          auto_create_subnetworks         = bool
          delete_default_routes_on_create = bool
      })
      bastion_subnet = object({
          ip_cidr_range            = string
          private_ip_google_access = bool
      })
      public_subnet = object({
          ip_cidr_range            = string
          private_ip_google_access = bool
      })
      private_subnet = object({
          ip_cidr_range            = string
          private_ip_google_access = bool
      })
  })

  default = {
    general = {
      environment = "dev"
      owner = "data-platform"
      project_name = "gcp-adventure-02"
      region = "us-central1"
    }
    vpc = {
      auto_create_subnetworks = false
      delete_default_routes_on_create = true
    }
    bastion_subnet = {
      ip_cidr_range = "10.20.0.0/16"
      private_ip_google_access = false
    }
    public_subnet = {
      ip_cidr_range = "10.21.0.0/16"
      private_ip_google_access = false
    }
    private_subnet = {
      ip_cidr_range = "10.22.0.0/16"
      private_ip_google_access = false
    }
  }
}