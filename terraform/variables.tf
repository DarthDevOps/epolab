variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

variable "zone" {
  description = "The GCP zone."
  type        = string
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
}

variable "database_name" {
  description = "The name of the MySQL database."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network."
  type        = string
}
variable "sql_user_name" {
  description = "The MySQL user name."
  type        = string
}

variable "sql_user_password" {
  description = "The MySQL user password."
  type        = string
}

variable "k8s_network_name" {
  description = "The name of the Kubernetes VPC network."
  type        = string
}