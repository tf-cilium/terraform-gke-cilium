resource "google_project_service" "this" {
  count   = var.enable_gke ? 1 : 0
  project = var.project_id
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_compute_network" "this" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "this" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.this.name
  ip_cidr_range = var.cidr
}

resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = "${var.region}-a"

  default_snat_status {
    disabled = true
  }

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.this.name
  subnetwork = google_compute_subnetwork.this.name

  depends_on = [google_project_service.this]
}

resource "google_container_node_pool" "this" {
  name     = google_container_cluster.this.name
  location = "${var.region}-a"
  cluster  = google_container_cluster.this.name

  node_count = 2

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]

    labels = {
      env = var.project_id
    }

    machine_type = "e2-medium"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    taint {
      key    = "node.cilium.io/agent-not-ready"
      value  = "true"
      effect = "NO_EXECUTE"
    }
  }
}

resource "terraform_data" "kubeconfig" {
  input = ""
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --location ${google_container_cluster.this.location}"
  }
}

resource "cilium" "this" {
  count = var.cilium.installed ? 1 : 0
  set = [
    "cluster.name=${var.cluster_name}"
  ]
  version    = var.cilium.version
  depends_on = [google_container_node_pool.this]
}
