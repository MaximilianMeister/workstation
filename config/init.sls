# config files
/home/mmeister/.ssh:
  file.directory:
    - user: mmeister
    - group: users
    - dir_mode: 700

/home/mmeister/.ssh/config:
  file.managed:
    - source: salt://config/home/mmeister/.ssh/config
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.vimrc:
  file.managed:
    - source: salt://config/home/mmeister/.vimrc
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.zshrc:
  file.managed:
    - source: salt://config/home/mmeister/.zshrc
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.screenrc:
  file.managed:
    - source: salt://config/home/mmeister/.screenrc
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.gitconfig:
  file.managed:
    - source: salt://config/home/mmeister/.gitconfig
    - user: mmeister
    - group: users
    - mode: 644

/home/mmeister/.config/i3:
  file.recurse:
    - source: salt://config/home/mmeister/.config/i3
    - user: mmeister
    - group: users
    - dir_mode: 755
    - file_mode: 644

/home/mmeister/.config/i3status:
  file.recurse:
    - source: salt://config/home/mmeister/.config/i3status
    - user: mmeister
    - group: users
    - dir_mode: 755
    - file_mode: 644

/home/mmeister/.config/i3/scripts/i3exit:
  file.managed:
    - source: salt://config/home/mmeister/.config/i3/scripts/i3exit
    - user: mmeister
    - group: users
    - mode: 755

/usr/share/X11/xorg.conf.d/40-libinput.conf:
  file.managed:
    - source: salt://config/usr/share/X11/xorg.conf.d/40-libinput.conf
    - user: root
    - group: root
    - mode: 644
