# ElasticCache (Redis) - Terraform best practices

Here is an example to create a Redis instance within the Kubernetes AWS accounts. Please *do not* create DNS entries for these endpoints as we will want to migrate to use TLS in the future.
```
# create a subnet group with our dependancies from tf-k8s-core
resource "aws_elasticache_subnet_group" "main" {
  name = "${var.role}-${var.env}-subnet"

  subnet_ids = [
    "${split(",",var.db_subnets)}",
  ]

  lifecycle {
    ignore_changes = [
      "subnet_ids",
    ]
  }
}

# create a parameter group 
resource "aws_elasticache_parameter_group" "main" {
  name   = "harbor-${var.env}"
  family = "${var.parameter_group_family}"

  parameter {
    name  = "maxmemory-policy"
    value = "${var.ecache_maxmemory_policy}"
  }
}

# create the Redis instance
resource "aws_elasticache_replication_group" "main" {
  replication_group_id          = "harbor-${var.env}"
  replication_group_description = "${var.role}-${var.env}"
  node_type                     = "${var.ecache_type}"
  number_cache_clusters         = "${var.ecache_size}"
  port                          = 6379
  parameter_group_name          = "${aws_elasticache_parameter_group.main.name}"
  automatic_failover_enabled    = true
  subnet_group_name             = "${aws_elasticache_subnet_group.main.name}"
  at_rest_encryption_enabled    = true
  transit_encryption_enabled    = true

  security_group_ids = [
    "${aws_security_group.redis.id}",
  ]

  # example tags
  tags {
    Terraform = "true"
    Name      = "${var.role}-${var.env}"
    ROLE      = "storage"
    OWNER     = "${var.owner}"
    ENV       = "${var.env}"
    PRODUCT   = "core-paas-harbor"
    SERVICE   = "redis"
    REPO      = "https://github.com/mulesoft-ops/tf-build-harbor"
  }
}

# required to connect to the ElastiCache endpoint
output "primary_ecache_endpoint_address" {
  value = "${aws_elasticache_replication_group.main.primary_endpoint_address}"
}
```
