
variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}

variable "bucket_acl" {
  description = "Type of access to the bucket"
  type        = string
}

variable "versioning_status" {
  description = "versioning should be enabled or disabled"
  type        = string
}
