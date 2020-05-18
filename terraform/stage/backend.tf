terraform {
backend "gcs" {
    bucket  = "mikronavt-storage"
    prefix  = "terraform/state"
  }
}
