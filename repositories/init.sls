# repositories
/etc/zypp/repos.d/packman.repo:
  file.managed:
    - source: salt://config/etc/zypp/repos.d/packman.repo

refresh:
  cmd.run:
    - name: "zypper -n --gpg-auto-import-keys refresh"
