provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = "rkey"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
		#!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.from_port} &
              EOF
  
  tags = {
 	Name = "my Instance"
   }
 
}

 resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
}


