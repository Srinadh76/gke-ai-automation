provider "google" {
  project = "test-440011"
  region  = "us-central1"
}

resource "google_container_cluster" "standard_ai" {

  name     = "standard-ai-cluster"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  vertical_pod_autoscaling {
    enabled = true
  }

  autoscaling {
    enable_node_autoprovisioning = true
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-pool"
  cluster    = google_container_cluster.standard_ai.name
  location   = "us-central1"

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "e2-standard-2"
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
