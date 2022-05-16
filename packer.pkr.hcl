source "virtualbox-iso" "gentoo-test" {
  boot_wait                 = "5s"
  boot_command              = ["gentoo dosshd passwd=L4rry_Th3_C0w", "<enter>", "<wait10s>", "<enter>", "<wait50s>"]
  firmware                  = "bios"
  disk_size                 = 40000
  guest_additions_mode      = "disable"
  guest_os_type             = "Gentoo_64"
  headless                  = true
  iso_checksum              = "file:https://distfiles.gentoo.org/releases/amd64/autobuilds/20220508T170538Z/install-amd64-minimal-20220508T170538Z.iso.DIGESTS"
  iso_url                   = "https://distfiles.gentoo.org/releases/amd64/autobuilds/20220508T170538Z/install-amd64-minimal-20220508T170538Z.iso"
  shutdown_command          = "poweroff"
  ssh_username              = "root"
  ssh_password              = "L4rry_Th3_C0w"
  ssh_timeout               = "10m"
  ssh_port                  = 22
  ssh_agent_auth            = false
  ssh_clear_authorized_keys = true
  skip_export               = true
  vboxmanage                = [
   ["modifyvm", "{{.Name}}", "--memory", "10035"],
   ["modifyvm", "{{.Name}}", "--cpus", "3"],
]
}

build {
  sources = ["source.virtualbox-iso.gentoo-test"]

  provisioner "ansible" {
    playbook_file           = "main.yml"
    inventory_file          = "inventory"
    collections_path        = "requirements.yml"
    use_proxy               = false
  }
}
