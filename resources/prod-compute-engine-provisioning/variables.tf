variable "vpc_cred" {
  type = string
  description = "service accounts credentials"
}

variable "project_id" {
  type        = string
  description = "The project ID to host the network in"
}

variable "network_name" {
  type        = string
  description = "The name of the VPC network being created"
}
variable "compute_engine_name" {
  type = string
  description = "The name of Compute Engine being created"
}

variable "machine" {
  type = string
  description = "Machine type being created"
}

variable "image" {
  type = string
  description = "Image being pulled"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the VPC subnetwork being created"
}

variable "region" {
  type        = string
  description = "GCP region in which to launch resources"
}

variable "zone" {
  type        = string
  description = "GCP zone in which to launch resources"
}

variable "gce_ssh_user" {
  type        = string
  description = "vm user"
}

variable "gce_ssh_pub_key_file" {
  type        = string
  description = "SSH key file"
}
