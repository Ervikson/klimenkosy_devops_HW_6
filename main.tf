
# #создаем облачную сеть
# resource "yandex_vpc_network" "develop" {
#   name = "develop-network"
# }

# #создаем подсеть
# resource "yandex_vpc_subnet" "develop_a" {
#   name           = "develop-${var.zone}"
#   zone           = var.zone
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.1.0/24"]
# }

# resource "yandex_vpc_subnet" "develop_b" {
#   name           = "develop-ru-central1-b"
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.2.0/24"]
# }
resource "yandex_vpc_security_group" "vm_sg" {
  name        = "vm-security-group"
  description = "Security group for VMs"
  network_id  = yandex_vpc_network.develop.id

  ingress {
    description    = "SSH"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTP"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTPS"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "All outgoing traffic"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}


module "vpc_dev" {
  source         = "./modules/vpc"
}

module "analytics_vm" {
  source             = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1fad353c98abb708c491ef22899fee4db46b717d"
  env_name           = "develop" 
  network_id         = module.vpc_dev.network.id
  subnet_zones       = [var.zone]
  subnet_ids         = [module.vpc_dev.subnet.id]
  instance_name      = "${var.analytics}-vm"
  instance_count     = 1
  image_family       = "ubuntu-2004-lts"
  public_ip          = false
  nat                = false
  security_group_ids = [yandex_vpc_security_group.vm_sg.id]

  labels = { 
    owner   = "klimenko.s.y",
    project = var.analytics
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "marketing_vm" {
  source             = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1fad353c98abb708c491ef22899fee4db46b717d"
  env_name           = "stage"
  network_id         = module.vpc_dev.network.id
  subnet_zones       = [var.zone]
  subnet_ids         = [module.vpc_dev.subnet.id]
  instance_name      = "${var.marketing}-vm"
  instance_count     = 1
  image_family       = "ubuntu-2004-lts"
  public_ip          = false
  nat                = false
  security_group_ids = [yandex_vpc_security_group.vm_sg.id]

  labels = { 
    owner   = "klimenko.s.y",
    project = var.marketing
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    username       = var.username
    ssh_public_key = file(var.ssh_public_key)
  }
}

