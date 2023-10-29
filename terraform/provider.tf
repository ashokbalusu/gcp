provider "google" {
  region  = "us-east4"
#   version = "~> 0.14.8"
  #   version = ">= 3.23.0"
  alias = "tf-pv1"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    #   version = "~> 0.14.8"
    }
  }
}