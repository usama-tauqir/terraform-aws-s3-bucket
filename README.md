\# terraform-aws-s3-bucket



Creates a private S3 bucket with encryption, public access blocked,

and optional versioning.



\## Usage

module "logs" {

&#x20; source = "git::https://github.com/YOUR-USERNAME/terraform-aws-s3-bucket.git?ref=v1.0.0"

&#x20; name   = "my-logs"

}



\## Inputs

\- name (required): bucket name prefix

\- enable\_versioning (optional, default false)

\- tags (optional)



\## Outputs

\- bucket\_name

\- bucket\_arn

