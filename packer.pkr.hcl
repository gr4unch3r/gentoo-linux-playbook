source "virtualbox-iso" "gentoo-test" {
  vm_name                   = "gentoo-test"
  boot_wait                 = "5s"
  boot_command              = ["gentoo dosshd passwd=L4rry_Th3_C0w", "<enter>", "<wait10s>", "<enter>", "<wait50s>"]
  firmware                  = "bios"
  disk_size                 = "40000"
  guest_additions_mode      = "disable"
  guest_os_type             = "Gentoo_64"
  headless                  = true
  iso_checksum              = "file:https://mirrors.kernel.org/gentoo/releases/amd64/autobuilds/20220515T170533Z/install-amd64-minimal-20220515T170533Z.iso.DIGESTS"
  iso_url                   = "https://mirrors.kernel.org/gentoo/releases/amd64/autobuilds/20220515T170533Z/install-amd64-minimal-20220515T170533Z.iso"
  disable_shutdown          = true
  ssh_username              = "root"
  ssh_password              = "L4rry_Th3_C0w"
  ssh_timeout               = "10m"
  ssh_port                  = "22"
  ssh_agent_auth            = false
  vboxmanage                = [
   ["modifyvm", "{{.Name}}", "--memory", "10035"],
   ["modifyvm", "{{.Name}}", "--cpus", "3"]
  ]
}

build {
  sources                   = ["source.virtualbox-iso.gentoo-test"]
  provisioner "ansible" {
    user                    = "root"
    ansible_env_vars        = ["ANSIBLE_HOST_KEY_CHECKING=false"] 
    extra_arguments         = ["--extra-vars", "ansible_password='L4rry_Th3_C0w'"]
    playbook_file           = "main.yml"
    collections_path        = "requirements.yml"
    use_proxy               = false
  }
  post-processor "vagrant" {
    output                  = "gentoo-test-{{.Provider}}.box"
    vagrantfile_template    = "vagrantfile.tpl"
    compression_level       = "9"
    keep_input_artifact     = false
  }
}
