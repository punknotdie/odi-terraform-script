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

variable "subnetwork_name" {
  type        = string
  description = "The name of the VPC subnetwork being created"
}

variable "subnetwork_range" {
  type        = string
  description = "GCP region in which to launch resources"
}

variable "range-pods-name" {
  type        = string
  description = "Pods range value"
}

variable "range-service-name" {
  type        = string
  description = "Service range value"
}

variable "prod-pods-range" {
  type        = string
  description = "prod pods range value"
}

variable "prod-service-range" {
  type        = string
  description = "prod service range value"
}

variable "region" {
  type        = string
  description = "GCP region in which to launch resources"
}

variable "zone" {
  type        = string
  description = "GCP zone in which to launch resources"
}
