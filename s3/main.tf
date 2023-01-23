########################################################
# MODULES
########################################################

module "s3_bucket_module" {
  source            = "../modules/s3"
  bucket_name       = "otc-ma"
  bucket_acl        = "public-read"
  versioning_status = "Enabled"
}
