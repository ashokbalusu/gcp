resource "google_storage_bucket" "gcs-gcs-test" {
  name          = "gcp-gcs-test1-20231022"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}