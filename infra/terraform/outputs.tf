output "backend_publicip" {
    value = aws_instance.backend_server.public_ip
}

output "database_endpoint" {
    value = aws_rds_cluster.postgres.endpoint
}
