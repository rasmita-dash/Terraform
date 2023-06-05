# Create ssh key
resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "key_from_terraform"
  public_key = file(var.ssh_public_file)
}

# Create security group
resource "aws_security_group" "allow_tls_TF" {
  name        = "allow_tls_TF"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description      = "TLS from VPC"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "web" {
  ami                    = var.image
  instance_type          = var.type
  key_name               = aws_key_pair.ssh_key_pair.key_name
  tags                   = { name = "EC2_from_TF" }
  vpc_security_group_ids = [aws_security_group.allow_tls_TF.id]
}