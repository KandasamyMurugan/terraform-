output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "web_lb_dns_name" {
  description = "DNS name of the web load balancer"
  value       = module.web_server.lb_dns_name
}

output "db_endpoint" {
  description = "Endpoint of the database"
  value       = module.database.db_endpoint
  sensitive   = true
}

