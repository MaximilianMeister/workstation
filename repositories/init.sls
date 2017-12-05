# repositories
/etc/zypp/repos.d/Virtualization_containers.repo:
  file.managed:
    - source: salt://config/repos/Virtualization_containers.repo
    - require_in:
      - pkg: docker_package

/etc/zypp/repos.d/devel_languages_go.repo:
  file.managed:
    - source: salt://config/repos/devel_languages_go.repo
    - require_in:
      - pkg: go_package

/etc/zypp/repos.d/devel_languages_ruby_extensions.repo:
  file.managed:
    - source: salt://config/repos/devel_languages_ruby_extensions.repo

/etc/zypp/repos.d/Packman.repo:
  file.managed:
    - source: salt://config/repos/Packman.repo

/etc/zypp/repos.d/X11_Utilities.repo:
  file.managed:
    - source: salt://config/repos/X11_Utilities.repo

/etc/zypp/repos.d/X11_windowmanagers.repo:
  file.managed:
    - source: salt://config/repos/X11_windowmanagers.repo
    - require_in:
      - pkg: i3_package

refresh:
  cmd.run:
    - name: "zypper -n --gpg-auto-import-keys refresh"
