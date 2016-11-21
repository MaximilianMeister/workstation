# repositories
/etc/zypp/repos.d/Virtualization_containers.repo:
  file.managed:
    - source: salt://config/repos/Virtualization_containers.repo

/etc/zypp/repos.d/devel_languages_go.repo:
  file.managed:
    - source: salt://config/repos/devel_languages_go.repo

/etc/zypp/repos.d/devel_languages_ruby_extensions.repo:
  file.managed:
    - source: salt://config/repos/devel_languages_ruby_extensions.repo

/etc/zypp/repos.d/Packman.repo:
  file.managed:
    - source: salt://config/repos/Packman.repo

/etc/zypp/repos.d/SUSE_CA.repo:
  file.managed:
    - source: salt://config/repos/SUSE_CA.repo

/etc/zypp/repos.d/X11_Utilities.repo:
  file.managed:
    - source: salt://config/repos/X11_Utilities.repo

/etc/zypp/repos.d/X11_windowmanagers.repo:
  file.managed:
    - source: salt://config/repos/X11_windowmanagers.repo

refresh:
  cmd.run:
    - name: "zypper --gpg-auto-import-keys refresh"

# package installation
make sure all packages are installed:
  pkg.installed:
    - pkgs:
      - git-core
      - patch
      - docker
      - go
      - gcc
      - make
      - qemu-kvm
      - virt-manager
      - i3lock
      - alsa-utils
      - gnome-terminal
      - chromium
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

libvirt:
  group.present:
    - gid: 4830
    - system: True

# user management
mmeister:
  user.present:
    - fullname: Maximilian Meister
    - shell: /bin/zsh
    - home: /home/mmeister
    - uid: 16983
    - gid: 100 # users
    - groups:
      - users
      - docker
      - libvirt
    - empty_password: True

# install other dependencies
oh-my-zsh:
  cmd.run:
    - name: |
        git clone git://github.com/robbyrussell/oh-my-zsh.git /home/mmeister/.oh-my-zsh; \
        chown -R mmeister:users /home/mmeister/.oh-my-zsh
    - unless: test -d /home/mmeister/.oh-my-zsh

# service management
make sure docker daemon is up and running:
  service.running:
    - name: docker
    - enable: True

# config files
/home/mmeister/.ssh:
  file.directory:
    - user: mmeister
    - group: users
    - dir_mode: 700

/home/mmeister/.ssh/config:
  file.managed:
    - source: salt://config/.ssh/config
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.vimrc:
  file.managed:
    - source: salt://config/.vimrc
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.zshrc:
  file.managed:
    - source: salt://config/.zshrc
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.screenrc:
  file.managed:
    - source: salt://config/.screenrc
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.gitconfig:
  file.managed:
    - source: salt://config/.gitconfig
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.config/awesome:
  file.recurse:
    - source: salt://config/awesome
    - user: mmeister
    - group: users
    - dir_mode: 755
    - file_mode: 644

/home/mmeister/.xinitrc:
  file.managed:
    - source: salt://config/.xinitrc
    - user: mmeister
    - group: users
    - mode: 644

/etc/sysconfig/windowmanager:
  file.managed:
    - source: salt://config/windowmanager
    - user: root
    - group: root
    - mode: 644

/etc/X11/xdm/xdm-config:
  file.managed:
    - source: salt://config/xdm-config
    - user: root
    - group: root
    - mode: 644
