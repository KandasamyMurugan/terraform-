output "lb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.web.dns_name
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web.name
}


output "web_sg_id" {
  value = aws_security_group.web.id
}

# Fixed output for instance public IPs
output "instance_public_ips" {
  description = "Public IPs of instances used in null_resource"
  value       = data.aws_instance.web_details.public_ip != "" ? [data.aws_instance.web_details.public_ip] : []
}
