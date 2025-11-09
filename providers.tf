terraform {
  required_version = "~>1.12.0"

  backend "s3" {

    profile                  = "default"
    region                   = "ru-central1"

    bucket  = "klimenko-tfstate-develop" # FIO-netology-tfstate
    key     = "hw/hw_7_terraform.tfstate"
    encrypt = false

    use_lockfile = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
  }

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.169.0"
    }
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
}