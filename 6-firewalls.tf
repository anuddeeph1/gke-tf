# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-kyverno" {
  name    = "allow-kyverno"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["9443"]
  }

  source_ranges = ["10.0.0.0/18","10.48.0.0/14","10.52.0.0/20","172.16.0.0/28"]
}
