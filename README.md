<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_cilium"></a> [cilium](#requirement\_cilium) | >=0.1.10 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cilium"></a> [cilium](#provider\_cilium) | 0.2.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 5.25.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cilium_cilium.this](https://registry.terraform.io/providers/littlejo/cilium/latest/docs/resources/cilium) | resource |
| [google_compute_network.this](https://registry.terraform.io/providers/hashicorp/google/5.25.0/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.this](https://registry.terraform.io/providers/hashicorp/google/5.25.0/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.this](https://registry.terraform.io/providers/hashicorp/google/5.25.0/docs/resources/container_cluster) | resource |
| [google_container_node_pool.this](https://registry.terraform.io/providers/hashicorp/google/5.25.0/docs/resources/container_node_pool) | resource |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/5.25.0/docs/resources/project_service) | resource |
| [terraform_data.kubeconfig](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | cidr | `string` | `"10.11.0.0/24"` | no |
| <a name="input_cilium"></a> [cilium](#input\_cilium) | Feature of Cilium | <pre>object({<br>    installed = bool<br>    version   = string<br>  })</pre> | <pre>{<br>  "installed": true,<br>  "version": "1.15.4"<br>}</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster | `string` | `"terraform-cilium"` | no |
| <a name="input_enable_gke"></a> [enable\_gke](#input\_enable\_gke) | Enable gke | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | project id | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->