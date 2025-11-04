terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.12.0"
}

resource "yandex_vpc_network" "develop" {
  name = "develop-net"
}

resource "yandex_vpc_subnet" "develop-sub" {
  name           = "develop-sub-${var.zone}"
  zone           = var.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.cidr]
}