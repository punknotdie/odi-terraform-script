provider "google" {
version = "3.5.0"
credentials = file(var.vpc_cred)
project = var.project_id
region = var.region
zone = var.zone
}

resource "google_compute_firewall" "vpc-allow-outbound" {
  name    = var.firewall_name
  network = var.network_name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "vpc_network" {
name = var.network_name
project = var.project_id
auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public-subnetwork" {
name = var.subnetwork_name
ip_cidr_range = var.subnetwork_range
region = var.region
network = var.network_name

    secondary_ip_range = [
        {
            range_name    = var.range-pods-name
            ip_cidr_range = var.prod-pods-range
        },
        {
            range_name    = var.range-service-name
            ip_cidr_range = var.prod-service-range
        },
        ]
}
