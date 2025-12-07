terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Télécharge l’image depuis DockerHub
resource "docker_image" "demo" {
  name         = "jejey333/demo-devops:latest"
  keep_locally = false
}

# Lance un conteneur local basé sur l’image
resource "docker_container" "demo_container" {
  name  = "demo-devops-container"
  image = docker_image.demo.image_id

  ports {
    internal = 80
    external = 8080
  }
}
