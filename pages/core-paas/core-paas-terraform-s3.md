# S3 - Terraform best practices

Here is an example of how to create an s3 bucket. The example includes how an IAM user might authenticate with the bucket. Please research the exact IAM permissions your user will use. This is only meant to be a guide:
```
# create the bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.role}-${var.bucket_name}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }

  lifecycle {
    ignore_changes = ["replication_configuration"]
  }

  versioning {
    enabled = true
  }

  tags {
    Terraform = "true"
    Name      = "${var.role}-registry"
    ROLE      = "storage"
    OWNER     = "${var.owner}"
    PRODUCT   = "core-paas-harbor"
    ENV       = "${var.env}"
    SERVICE   = "kubernetes"
    REPO      = "https://github.com/mulesoft-ops/tf-build-harbor"
    replicate = "yes"
  }
}

# attach a policy to the IAM user created
resource "aws_iam_user_policy" "policy" {
  name = "s3-${var.role}-${var.env}"
  user = "${aws_iam_user.user.name}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1412062044000",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject"
            ],
            "Resource": [
                "${aws_s3_bucket.bucket.arn}/*"
            ]
        },
        {
            "Sid": "Stmt1412062128000",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "${aws_s3_bucket.bucket.arn}"
            ]
        }
    ]
}
EOF
}
```
