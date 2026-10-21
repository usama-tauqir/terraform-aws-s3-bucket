# Pretend to be AWS: nothing real is created
mock_provider "aws" {}

# Inputs used by every test below
variables {
  name = "test"
}

run "versioning_off_by_default" {
  command = plan

  assert {
    condition     = length(aws_s3_bucket_versioning.this) == 0
    error_message = "Versioning should be off unless asked for"
  }
}

run "versioning_on_when_enabled" {
  command = plan

  variables {
    enable_versioning = true
  }

  assert {
    condition     = length(aws_s3_bucket_versioning.this) == 1
    error_message = "Versioning should be created when enable_versioning = true"
  }
}

run "public_access_always_blocked" {
  command = plan

  assert {
    condition     = aws_s3_bucket_public_access_block.this.block_public_acls == true
    error_message = "Public access must always be blocked"
  }
}

run "standard_tags_and_name" {
  command = apply

  assert {
    condition     = aws_s3_bucket.this.tags["ManagedBy"] == "terraform"
    error_message = "Every bucket must have ManagedBy = terraform"
  }

  assert {
    condition     = startswith(aws_s3_bucket.this.bucket, "test-")
    error_message = "Bucket name must start with the given name"
  }
}