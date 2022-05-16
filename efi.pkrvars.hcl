variable "firmware" {
  type = string
  default = "efi"
}

variable "boot_command" {
  type = list
  default = [""]
}
