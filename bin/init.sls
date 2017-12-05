/usr/local/bin/lockmyi3:
  file.managed:
    - source: salt://bin/lockmyi3
    - user: mmeister
    - group: users
    - mode: 755
