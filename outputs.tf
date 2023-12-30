output "minio_id" {
  value = minio_s3_bucket.s3_bucket.id
}

output "minio_connection" {
  value = minio_s3_bucket.s3_bucket.connection
}