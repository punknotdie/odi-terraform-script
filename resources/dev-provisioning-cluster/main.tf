provider "google" {
    credentials = file(var.gcp_credentials)
    project = var.gcp_project_id
    region = var.gcp_region
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gcp_region
  regional                   = var.gke_region
  zones                      = var.gke_zones
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = var.gke_ip_range_pods
  ip_range_services          = var.gke_ip_range_services
  http_load_balancing        = true
  network_policy             = true
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  create_service_account     = false

  node_pools = [
    {
      name                      = var.gke_default_nodepool_name
      machine_type              = "e2-medium"
      node_locations            = var.gke_node_location
      node_counts               = 1
      min_count                 = 1
      max_count                 = 100
      local_ssd_count           = 0
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      enable_gcfs               = false
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.gke_service_account_name
      preemptible               = true
      initial_node_count        = 1
    },
  ]
}

