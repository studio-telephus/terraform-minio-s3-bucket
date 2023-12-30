resource "minio_s3_bucket" "s3_bucket" {
  bucket = var.bucket
  acl    = var.bucket_acl
}

resource "minio_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = minio_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.versioning_configuration.enabled ? "Enabled" : "Disabled"
  }
}

resource "minio_s3_bucket_server_side_encryption" "s3_encryption" {
  count           = var.encryption_configuration.enabled == true ? 1 : 0
  bucket          = minio_s3_bucket.s3_bucket.id
  encryption_type = var.encryption_configuration.encryption_type
  kms_key_id      = var.encryption_configuration.kms_key_id
}

resource "minio_s3_bucket_policy" "bucket_policy" {
  count  = length(var.policies)
  bucket = minio_s3_bucket.s3_bucket.id
  policy = var.policies[count.index]
}
