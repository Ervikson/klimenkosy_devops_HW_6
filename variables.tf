###cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable ssh_public_key {
  type        = string
  description = "Location of SSH public key."
}

variable "analytics" {
  description = "Label for analitycs VM`s"
  type        = string
  default     = "analytics"
}

variable "marketing" {
  description = "Label for marketings VM`s"
  type        = string
  default     = "marketing"
}

variable "zone" {
  description = "Default zone"
  type        = string
  default     = "ru-central1-a"
}

variable "username" {
  description = "Username for SSH"
  type        = string
  default     = "ubuntu"
}

variable "single_ip" {
  type        = string
  description = "ip-адрес с валидацией через cidrhost"
  default     = "1920.168.0.1"

  validation {
    condition     = can(cidrhost("${var.single_ip}/32", 0))
    error_message = "Значение должно быть валидным IPv4 адресом."
  }
}

variable "ip_list" {
  type        = list(string)
  description = "список ip-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.ip_list : can(cidrhost("${ip}/32", 0))
    ])
    error_message = "Все значения в списке должны быть валидными IPv4 адресами."
  }
}