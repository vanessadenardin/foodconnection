resource "aws_instance" "backend_server" {
  ami                    = "ami-0210560cedcb09f07"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.backend_server.id]
  key_name               = "<key-name>"

  tags = {
    Name = "backend-server"
  }
}

resource "aws_rds_cluster" "postgres" {
  cluster_identifier      = "food-connection-db"
  engine                  = "aurora-postgresql"
  engine_mode             = "serverless"
  availability_zones      = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  master_username         = "postgres"
  master_password         = "random123EXAMPLE"
  vpc_security_group_ids  = [aws_security_group.backend_db.id]
  deletion_protection     = false
  skip_final_snapshot     = true
  
  scaling_configuration {
    min_capacity = 2
  }
}
