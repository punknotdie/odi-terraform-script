provider "google" {
version = "3.5.0"
credentials = file(var.vpc_cred)
project = var.project_id
region = var.region
zone = var.zone
}

resource "google_compute_instance" "ubuntu" {
  project                   = var.project_id
  name                      = var.compute_engine_name
  machine_type              = var.machine
  zone                      = var.zone
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnetwork_name

    access_config {
    }
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  tags = ["allow-web", "allow-ssh"]
}
