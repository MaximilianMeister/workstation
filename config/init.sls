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

/home/mmeister/.config/sway:
  file.recurse:
    - source: salt://config/sway
    - user: mmeister
    - group: users
    - dir_mode: 755
    - file_mode: 644

/home/mmeister/.config/sway/scripts/swayexit:
  file.managed:
    - source: salt://config/sway/scripts/swayexit
    - user: mmeister
    - group: users
    - mode: 755
