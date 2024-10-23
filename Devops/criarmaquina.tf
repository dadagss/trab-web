terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"  
    }
  }
}

provider "docker" {}

resource "docker_container" "nginx_container" {
  name  = "meu_container_daBET"
  image = "sitev2"  # Imagem existente

  ports {
    internal = 80
    external = 8080
  }
}
