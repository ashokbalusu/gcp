resource "google_storage_bucket" "gcs-gcs-test" {
  # provider = google.tf-pv1

  name          = "gcp-gcs-test1-20231029"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}