<<<<<<< HEAD
# epolab
=======
# epolab
## Overview

This project is focused on setting up a Kubernetes (k8s) cluster using Kops, Google Cloud Platform (GCP) resources, and deploying an EPO platform built on WordPress. The setup includes logging and monitoring with Prometheus, Elasticsearch, Fluentd, and Kibana. A new storage class for the Kubernetes cluster has also been created.

## Kubernetes Cluster Setup

The Kubernetes cluster is set up using Kops. The configuration for the cluster can be found in the `kops-cluster.yaml` file.

## Google Cloud Platform Resources

Terraform has been used to create the following GCP resources:

- MySQL instance
- Database and user for the MySQL instance
- VPC peering
- Compute networks

## Logging and Monitoring

The logging and monitoring setup consists of:

- Prometheus
- Elasticsearch
- Fluentd
- Kibana

Additionally, the Metrics Server has been installed. The configuration files for the logging and monitoring setup can be found in the `logging-monitoring` folder.

## Storage Class

A new storage class has been created for the Kubernetes cluster. The YAML file for the storage class can be found in the `other-yaml` folder.

## EPO Platform Deployment

The EPO platform is built as a WordPress site, serving as a content management system for the organization. The deployment on the Kubernetes cluster is designed to ensure high availability, scalability, and effective resource utilization.

### Components

The deployment consists of the following components:

- **3 WordPress Pods**: These pods run the WordPress application, utilizing the newly created storage class for persistent storage. The number of pods can be adjusted based on the traffic and resource requirements of the site.

- **MySQL SQL Instance**: The platform uses a MySQL SQL instance as the backend database to store the site's content, settings, and user information. The MySQL instance is hosted on Google Cloud Platform and managed through Terraform.

- **Load Balancer**: A load balancer is set up in front of the WordPress pods to distribute incoming traffic evenly across the pods. This ensures optimal performance and high availability of the site.

- **Persistent Volumes and Claims**: Persistent Volumes (PVs) and Persistent Volume Claims (PVCs) are used to provide storage for the WordPress application. This ensures that data is retained across pod restarts and updates.
>>>>>>> ec725c9 (files added)
