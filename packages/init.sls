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

i3_package:
  pkg.installed:
    - pkgs:
      - i3-gaps
      - i3lock
      - i3status

other_package:
  pkg.installed:
    - pkgs:
      - chromium
      - patch
      - gcc
      - make
      - alsa-utils
      - gnome-terminal
      - ruby-devel
      - libxml2-devel
      - sqlite3-devel
      - nextcloud-client
      - rofi
      - feh
      - scrot
