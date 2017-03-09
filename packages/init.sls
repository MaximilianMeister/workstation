# package installation
git_package:
  pkg.installed:
    - name: git-core
    - require_in:
      - cmd: oh-my-zsh

docker_package:
  pkg.installed:
    - name: docker
    - require_in:
      - user: mmeister
      - service: docker_service

libvirt_package:
  pkg.installed:
    - pkgs:
      - libvirt
      - qemu-kvm
      - virt-manager
    - require_in:
      - user: mmeister
      - service: libvirt_service
      - group: libvirt_group

go_package:
  pkg.installed:
    - name: go
    - require_in:
      - run: go_env

awesome_package:
  pkg.installed:
    - pkgs:
      - awesome
      - awesome-branding-upstream
      - awesome-copycats-themes
      - awesome-eminent
      - awesome-freedesktop
      - awesome-lain
      - awesome-menugen
      - awesome-scratchdrop
      - awesome-shifty
      - awesome-vicious

ca-certificates:
  pkg.installed:
    - name: ca-cerificates-suse

other_package:
  pkg.installed:
    - pkgs:
      - chromium
      - chromium-pepper-flash
      - patch
      - gcc
      - make
      - i3lock
      - alsa-utils
      - gnome-terminal
      - ruby-devel
      - libxml2-devel
      - sqlite3-devel
      - ImageMagick
