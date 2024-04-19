variable "project_id" {
  description = "project id"
  type        = string #gcloud config get-value project
}

variable "region" {
  description = "region"
  type        = string
}

variable "cidr" {
  description = "cidr"
  type        = string
  default     = "10.11.0.0/24"
}

variable "enable_gke" {
  description = "Enable gke"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "terraform-cilium"
}

variable "cilium" {
  description = "Feature of Cilium"
  type = object({
    installed = bool
    version   = string
  })
  default = {
    installed = true
    version   = "1.15.4"
  }
}
