resource "google_storage_bucket" "hca-hde-poc-bucket" {
  name          = "hca-hde-poc-pt-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
