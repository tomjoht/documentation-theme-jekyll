# RDS - Terraform best practices

Here are the best practices we recommend when creating and RDS instance from within our Kubernetes AWS accounts. To retrieve the randomly generated password, please contact a member of the Core PaaS team and we will retrieve it from the vault. We are working on a better way of handling these secrets. Please *do not* create DNS entries for these endpoints as we will want to migrate to use TLS in the future.
```
# create a randomized password to be stored encrypted at rest
resource "random_password" "password" {
  length  = 32
  special = false
}

# create the RDS instance
resource "aws_db_instance" "main" {
  identifier                  = "${var.role}-${var.environment}"
  instance_class              = "${var.rds_type}"
  allocated_storage           = "${var.db_storage_size}"
  backup_retention_period     = "${var.backup_retention_period}"
  engine                      = "postgres"
  engine_version              = "9.6.1"
  name                        = "${replace(var.role,"-","_")}"
  username                    = "${replace(var.role,"-","_")}"
  # randomize password creation
  password                    = "${random_password.password.result}"
  db_subnet_group_name        = "${var.db_subnet_group_name}"
  multi_az                    = "${var.multi_az}"
  storage_type                = "gp2"
  allow_major_version_upgrade = false
  apply_immediately           = true
  # encrypt using our KMS key
  kms_key_id                  = "${var.rds_vpc_kms_arn != "" ? var.rds_vpc_kms_arn : ""}"
  storage_encrypted           = "${var.rds_vpc_kms_arn != "" ? 1 : 0}"
  parameter_group_name        = "pgbadger-postgres96"

  vpc_security_group_ids = [
    "${aws_security_group.database.id}",
  ]

  # example tags
  tags {
    ENV     = "${var.environment}"
    Name    = "${var.role}-${var.environment}"
    OWNER   = "exchange"
    ROLE    = "${var.role}"
    PROJECT = "exchange2"
    PRODUCT = "exchange2"
    SERVICE = "database"
    REPO    = "tf-exchange2-search"
    backup  = "yes"
  }

  auto_minor_version_upgrade = false

  lifecycle {
    ignore_changes = [
      "identifier",
      "kms_key_id",
      "storage_encrypted",
      "password",
    ]
  }
}

# create the security group for the RDS instance
resource "aws_security_group" "database" {
  name        = "${var.role}-db-${var.environment}"
  description = "${var.role}-db-${var.environment}"
  vpc_id      = "${var.vpc_id}"

  tags {
    ENV     = "${var.environment}"
    Name    = "${var.role}-${var.environment}"
    OWNER   = "exchange"
    ROLE    = "${var.role}"
    PROJECT = "exchange2"
    PRODUCT = "exchange2"
    SERVICE = "database"
    REPO    = "tf-exchange2-search"
  }

  lifecycle {
    ignore_changes = [
      "name",
      "description",
    ]
  }
}

# create a security group rule and attach it to the group created above to allow traffic from our infrastructure
resource "aws_security_group_rule" "database-allow-ingress-main" {
  type      = "ingress"
  from_port = 5432
  to_port   = 5432
  protocol  = "tcp"

  security_group_id = "${aws_security_group.database.id}"
  cidr_blocks       = ["${var.cidr_block}"]
}

# required to connect to the RDS endpoint
output "primary_rds_endpoint_address" {
  value = "${aws_db_instance.main.endpoint}"
}
```
