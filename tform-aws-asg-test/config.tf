terraform {
  backend "s3" {
    bucket  = "tform-state-files"
    encrypt = "true"
    region  = "us-west-2"
    key     = "tf-instance02/tf-instance02.tfstate"
  }
}
