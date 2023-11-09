provider "google" {
  project = "hcahde040-dev-intake"
  region  = "us-east4"
#   version = "~> 0.14.8"
  #   version = ">= 3.23.0"
  alias = "tf-pt1"
}

terraform {
  required_version = "= 1.6.1"
  
  required_providers {
    google = {
      source  = "hashicorp/google"
    #   version = "~> 0.14.8"
    }
  }
}