terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.4.5"
    }
  }

  cloud {
    organization = "everyones-a-critic"
    workspaces {
      name = "ratings-service"
    }
  }

  required_version = "~> 1.3.0"
}

provider "mongodbatlas" {}

resource "mongodbatlas_project" "main" {
  name   = "everyones-a-critic"
  org_id = var.mongo_org_id
}


resource "mongodbatlas_project_ip_access_list" "main" {
  project_id = mongodbatlas_project.main.id
  cidr_block = "0.0.0.0/0"
  comment    = "Access from anywhere, as private networks aren't supported on the free tier"
}

resource "mongodbatlas_database_user" "cli_user" {
  username           = "cli_user"
  password           = var.cli_user_password
  project_id         = mongodbatlas_project.main.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}