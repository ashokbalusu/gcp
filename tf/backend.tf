terraform {
  required_version = "= 1.6.1"

  backend "gcs" {
    bucket = "hcahde040-dev-tf-state"
    prefix = "dev-tf-state"
  }
}