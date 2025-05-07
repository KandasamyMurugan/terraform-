variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the database"
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "List of security group IDs allowed to access the database"
  type        = list(string)
}

variable "db_instance_class" {
  description = "Instance class for the database"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for the database (in GB)"
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage for the database (in GB)"
  type        = number
  default     = 100
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}