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

variable "cidr" {
  type        = string
  description = "IP and mask for subnet"
  default     = "10.0.3.0/24"
}
