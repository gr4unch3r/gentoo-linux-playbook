# Gentoo Linux Ansible Playbook

[![CI](https://github.com/gr4unch3r/gentoo-linux-playbook/actions/workflows/ci.yml/badge.svg)](https://github.com/gr4unch3r/gentoo-linux-playbook/actions/workflows/ci.yml)

This playbook installs and configures [Gentoo Linux](https://www.gentoo.org/), following the [Gentoo AMD64 Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Installation).

## Requirements

- x86_64 target machine
- [Gentoo Minimal Installation CD](https://www.gentoo.org/downloads/)

## Overriding Defaults

You can override any of the defaults configured in ```default.config.yml``` by creating a ```config.yml``` file and setting the overrides in that file.

## Getting Started

Boot Gentoo install media on target machine with the following boot options:

```
gentoo dosshd passwd=L4rry_Th3_C0w
```

Then on Ansible controller:

```
$ git clone https://github.com/gr4unch3r/gentoo-linux-playbook.git
$ cd gentoo-linux-playbook
$ vim config.yml # Set overrides
$ make && make install
```

## License

MIT

## Author Information

gr4unch3r [at] protonmail [dot] com
