terraform {
  backend "gcs" {
    bucket  = "terraform-bucket-demoo"
    prefix  = "terraform/state"
  }
}


provider "google" {
  credentials = file("/home/mahendra.k@optit.india/terraform-demo/calcium-branch-424707-h4-2f217650732b.json")
  project     = "148787213897"
  region      = "us-east4"
}

resource "google_compute_instance" "my_instance" {
  name         = "demo-gcp-instance"
  machine_type = "n1-standard-1"
  zone         = "us-east4-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

