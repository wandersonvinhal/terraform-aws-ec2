variable "ec2_name" {
  type        = string
  description = "Nome da instância"
}

variable "ec2_region" {
  default     = "us-west-2"
  type        = string
  description = "Região que será criada a instância"
}

variable "ec2_tipo" {
  default     = "t2.micro"
  type        = string
  description = "Tipo de instância"
}

variable "ec2_ssh_key" {
  default     = "~/.ssh/aws_terraform.pub"
  type        = string
  description = "Chave ssh para conexão na instância"
}

variable "instance_count" {
  default     = 1
  type        = number
  description = "Qauntidade de instâncias a serem criadas"
}
