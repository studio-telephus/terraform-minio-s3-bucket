variable "bucket" {
  type = string
}

variable "bucket_acl" {
  type    = string
  default = "private"
}

variable "versioning_configuration" {
  type = object({
    enabled = bool
  })
  default = {
    enabled = true
  }
  description = "Versioning configuration"
}

variable "encryption_configuration" {
  type = object({
    enabled         = bool
    encryption_type = string
    kms_key_id      = string
  })
  default = {
    enabled         = false
    encryption_type = "AES256"
    kms_key_id      = null
  }
  description = "Encryption configuration"
}

variable "policies" {
  type        = map(any)
  default     = {}
  description = "Custom IAM policies"
}
