output "db_endpoint" {
  description = "Endpoint of the database"
  value       = aws_db_instance.db.endpoint
}

output "db_name" {
  description = "Name of the database"
  value       = aws_db_instance.db.id
}