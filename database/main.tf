resource "aws_security_group" "db" {
  name        = "${var.environment}-db-sg"
  description = "Security group for database"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.allowed_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-db-sg"
    }
  )
}

resource "aws_db_subnet_group" "db" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-db-subnet-group"
    }
  )
}

resource "aws_db_parameter_group" "db" {
  name   = "${var.environment}-db-params"
  family = "mysql8.0"

  parameter {
    name  = "max_connections"
    value = var.environment == "prod" ? "150" : "50"
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-db-params"
    }
  )
}

resource "aws_db_instance" "db" {
  identifier             = "${var.environment}-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  username               = "admin"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db.name
  vpc_security_group_ids = [aws_security_group.db.id]
  parameter_group_name   = aws_db_parameter_group.db.name
  multi_az               = var.environment == "prod" ? true : false
  storage_encrypted      = var.environment == "prod" ? true : false
  skip_final_snapshot = true
  final_snapshot_identifier = "${var.environment}-db-final-snapshot"
  backup_retention_period = var.backup_retention_period
  deletion_protection     = false

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-db"
    }
  )
}