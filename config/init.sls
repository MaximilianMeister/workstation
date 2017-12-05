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

/home/mmeister/.config/i3:
  file.recurse:
    - source: salt://config/i3
    - user: mmeister
    - group: users
    - dir_mode: 755
    - file_mode: 644

/home/mmeister/.config/i3/scripts/i3exit:
  file.managed:
    - source: salt://config/i3/scripts/i3exit
    - user: mmeister
    - group: users
    - mode: 755

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
