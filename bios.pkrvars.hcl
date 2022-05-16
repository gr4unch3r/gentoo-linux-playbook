variable "firmware" {
  type = string
  default = "bios"
}

variable "boot_command" {
  type = list
  default = ["gentoo dosshd passwd=L4rry_Th3_C0w", "<enter>", "<wait10s>", "<enter>", "<wait50s>"]
}
