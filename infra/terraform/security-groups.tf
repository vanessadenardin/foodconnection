resource "aws_security_group" "backend_server" {
  name        = "backend-server"
  description = "Allow connections to public instance for 22 and 3000 ports"
  vpc_id      = "vpc-05d31f62"

  ingress = [
    {
      description      = "port 22 for ssh administration"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false

    },
    {
      description      = "port 3000 for api access"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "allowing internet access"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "backend-server"
  }
}

resource "aws_security_group" "backend_db" {
  name        = "backend-db"
  description = "Allow connections from server to db on port 5432"
  vpc_id      = "vpc-05d31f62"

  ingress = [
    {
      description      = "port 5432 postgres"
      from_port        = 5432
      to_port          = 5432
      protocol         = "tcp"
      security_groups  = [aws_security_group.backend_server.id]
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
    }
  ]

  tags = {
    Name = "backend-db"
  }
}
