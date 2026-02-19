provider "google" {
  project = "test-440011"
  region  = "us-central1"
}

resource "google_container_cluster" "autopilot" {
  name     = "ai-autopilot-cluster"
  location = "us-central1"

  enable_autopilot = true

  release_channel {
    channel = "REGULAR"
  }
}
