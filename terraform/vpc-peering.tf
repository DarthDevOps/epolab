# The Kubernetes VPC network
resource "google_compute_network" "k8s_network" {
  name                    = var.k8s_network_name
  auto_create_subnetworks = false
}

# VPC peering between private-network and simple-k8s-local
resource "google_compute_network_peering" "private_to_k8s_peering" {
  name         = "private-to-k8s-peering"
  network      = google_compute_network.private_network.self_link
  peer_network = google_compute_network.k8s_network.self_link
}

resource "google_compute_network_peering" "k8s_to_private_peering" {
  name         = "k8s-to-private-peering"
  network      = google_compute_network.k8s_network.self_link
  peer_network = google_compute_network.private_network.self_link
}
