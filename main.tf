module "dev_vpc" {
  source = "../../modules/vpc"
  network_settings = var.network_settings
}


# BASTION Firewall
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "bastion_firewall" {
  name = "bastion-firewall"
  network = module.dev_vpc.vpc_self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["bastion-firewall"]
}


# PUBLIC Firewall
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "public_firewall" {
  name = "public-firewall"
  network = module.dev_vpc.vpc_self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["public-firewall"]
}


# PRIVATE Firewall
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "private_firewall" {
  name = "private-firewall"
  network = module.dev_vpc.vpc_self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction = "INGRESS"
  source_ranges = ["10.20.0.0/16","10.21.0.0/16","10.22.0.0/16"]
  target_tags = ["private-firewall"]
}