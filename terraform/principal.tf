terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "demo" {
  name = "jejey333/demo-devops:latest"
}

resource "docker_container" "demo_container" {
  name  = "demo-devops-container"
  image = docker_image.demo.name
  ports {
    internal = 80
    external = 8080
  }
}
