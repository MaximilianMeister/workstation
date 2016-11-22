# system
libvirt_group:
  group.present:
    - name: libvirt
    - gid: 4830
    - system: True
    - addusers:
      - mmeister
    - require:
      - user: mmeister

docker_group:
  group.present:
    - name: docker
    - gid: 4770
    - system: True
    - addusers:
      - mmeister
    - require:
      - user: mmeister

go_env:
  cmd.run:
    - name: |
        mkdir -p /home/mmeister/go/{bin,pkg,src}; \
        chown -R mmeister:users /home/mmeister/go
    - require:
      - user: mmeister

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

# install other dependencies
oh-my-zsh:
  cmd.run:
    - name: |
        git clone git://github.com/robbyrussell/oh-my-zsh.git /home/mmeister/.oh-my-zsh; \
        chown -R mmeister:users /home/mmeister/.oh-my-zsh
    - unless: test -d /home/mmeister/.oh-my-zsh
    - require:
      - user: mmeister
