variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC for display in server information"
  type        = string
  default     = "default"  # Provide a default value to avoid errors if not specified
}

/*variable "key_name" {
  description = "Name of the EC2 key pair to associate with instances"
  type        = string
  default     = null
}*/


variable "subnet_ids" {
  description = "List of subnet IDs for the web servers"
  type        = list(string)
}

variable "ssh_private_key" {
  description = "Content of the SSH private key for connecting to instances"
  type        = string
  sensitive   = true
  # No default - must be provided by tfvars or environment variable
}


variable "ami_id" {
  description = "AMI ID to use for the web servers"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the web servers"
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired capacity for the ASG"
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Minimum size for the ASG"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum size for the ASG"
  type        = number
  default     = 4
}

variable "create_https_listener" {
  description = "Whether to create an HTTPS listener"
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}

