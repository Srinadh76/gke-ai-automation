provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "existing" {

  name     = var.cluster_name
  location = var.region

  vertical_pod_autoscaling {
    enabled = true
  }

  autoscaling {
    enable_node_autoprovisioning = true
  }

  release_channel {
    channel = "REGULAR"
  }
}
