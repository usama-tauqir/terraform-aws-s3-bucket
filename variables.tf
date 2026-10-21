variable "name" {
  type        = string
  description = "Short name for the bucket, e.g. logs or backups"
}

variable "enable_versioning" {
  type        = bool
  description = "Keep old versions of files"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Extra tags to add"
  default     = {}
}
variable "force_destroy" {
  type        = bool
  description = "Delete all objects so the bucket can be destroyed"
  default     = false
}