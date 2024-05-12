terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#EC2
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_tipo
  key_name               = aws_key_pair.ssh_key.id
  vpc_security_group_ids = [aws_security_group.sg-ssh-http.id]
  user_data              = file("${path.module}/install_apache.sh")
  count                  = var.instance_count
  tags = {
    Name = "${var.ec2_name}-${count.index + 1}"
  }

}

#CHAVE SSH
resource "aws_key_pair" "ssh_key" {
  key_name   = "key_terraform"
  public_key = file(var.ec2_ssh_key)
}

#SECURITY GROUP
resource "aws_security_group" "sg-ssh-http" {
  name        = "permitir_ssh_http"
  description = "Permite SSH e HTTP na instancia EC2"

  ingress {
    description = "Acesso SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Acesso HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-ssh-http"
  }
}