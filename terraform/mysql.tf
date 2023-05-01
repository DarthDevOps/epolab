
resource "google_project_service" "service_networking" {
  service = "servicenetworking.googleapis.com"
}

resource "google_compute_network" "private_network" {
  name                    = var.network_name
  auto_create_subnetworks = true
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.private_network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
}

resource "google_compute_global_address" "private_ip_range" {
  name          = "private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.private_network.self_link
}

resource "google_sql_database_instance" "mysql_instance" {
  depends_on = [google_project_service.service_networking]

  name             = var.instance_name
  region           = var.region
  database_version = "MYSQL_5_7"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.private_network.self_link
    }

    backup_configuration {
      enabled = true
    }
  }
}

resource "google_sql_database" "database" {
  name       = var.database_name
  instance   = google_sql_database_instance.mysql_instance.name
}

resource "google_sql_user" "mysql_user" {
  name     = var.sql_user_name
  instance = google_sql_database_instance.mysql_instance.name
  password = var.sql_user_password
}

resource "google_compute_firewall" "allow_mysql" {
  name    = "allow-mysql"
  network = google_compute_network.private_network.name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  source_ranges = ["10.0.16.0/20"]
}

output "instance_connection_name" {
  value = google_sql_database_instance.mysql_instance.connection_name
}

output "instance_ip_address" {
  value = google_sql_database_instance.mysql_instance.private_ip_address
}
