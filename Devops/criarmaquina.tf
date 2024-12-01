provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0866a3c8686eaeeba" # Substitua por uma AMI válida
  instance_type = "t2.nano"

  # Copiar os arquivos locais usando provisão
  provisioner "file" {
    source      = "../site/" # Caminho para a pasta local 'site'
    destination = "/home/ec2-user/trab-web/site" # Destino na instância EC2

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = var.ssh_private_key # Usando a variável para a chave privada
      host        = self.public_ip
    }
  }

  # Inicializar a instância com o Docker e Docker Compose
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker -y",
      "sudo yum install -y python3-pip",
      "sudo pip3 install docker-compose",
      "sudo service docker start",
      "sudo systemctl enable docker",
      "cd /home/ec2-user/trab-web/site",
      "sudo docker-compose up -d"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = var.ssh_private_key # Usando a variável para a chave privada
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Trab-Web-Instance"
  }
}

# Definição da variável para a chave privada
variable "ssh_private_key" {
  description = "Chave privada SSH para conectar à instância EC2"
  type        = string
  sensitive   = true # Oculta a chave durante a execução
}

# Output do IP público da instância
output "instance_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.example.public_ip
}
