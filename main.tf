
resource "aws_instance" "private_instance"{
    ami =var.ami_id
    instance_type =var.private_instance_type
    availability_zone = var.availability_zone
    key_name =var.PATH_TO_PUBLIC_KEY
    subnet_id = var.private_subnets
    associate_public_ip_address = false
    source_dest_check = false
    security_groups = [aws_security_group.ssh_priv_test.id]
   

    tags = {
    Name = "Tomcat_Server_private"
  }
    
}

// SG to onlly allow SSH connections from VPC public subnets
resource "aws_security_group" "ssh_priv_test" {
  name        = "${var.environment}-allow_ssh_priv_test"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH only from internal VPC clients"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  ingress {
    description = "http"
    from_port = "8080"
    to_port   = "8080"
    protocol  = "tcp"
    cidr_blocks = [var.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-allow_ssh_priv_test"
  }
}