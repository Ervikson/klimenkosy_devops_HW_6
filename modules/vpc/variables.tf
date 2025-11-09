variable "zone" {
  type        = string
  description = "default zone"
  default     = "ru-central1-a"
}

variable "cidr" {
  type        = string
  description = "IP and mask for subnet"
  default     = "10.0.3.0/24"
}