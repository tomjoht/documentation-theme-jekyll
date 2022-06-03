# IAM user and access keys

Currently we do not support IAM role authentication so if you are required to access AWS resources you will need to create an IAM user. This can be done with the example below:
```
resource "aws_iam_user" "user" {
  name = "${var.role}-${var.environment}"
}

resource "aws_iam_access_key" "key" {
  user = "${aws_iam_user.user.name}"
}
```

**DO NOT** output these keys into Jenkins runs or the keys will be required to be rotated as they should not be in plaintext. To retrieve and encrypt them please ask a Core PaaS member. We are working on a better solution to this problem as handling of secrets should not be this manual.
