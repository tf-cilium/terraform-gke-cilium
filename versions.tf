terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
    cilium = {
      source  = "littlejo/cilium"
      version = ">=0.1.10"
    }
  }
  required_version = ">= 1.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "cilium" {
  config_path = terraform_data.kubeconfig.input
}
