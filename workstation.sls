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
    #- uid: 16983
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

nerdtree:
  cmd.run:
    - name: |
        mkdir -p ~/.vim/bundle; \
        git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree; \
        chown -R mmeister:users /home/mmeister/.vim/bundle/nerdtree
    - unless: test -d /home/mmeister/.vim/bundle/nerdtree
    - require:
      - user: mmeister

ctrlp:
  cmd.run:
    - name: |
        mkdir -p ~/.vim/bundle; \
        git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim; \
        chown -R mmeister:users /home/mmeister/.vim/bundle/ctrlp.vim
    - unless: test -d /home/mmeister/.vim/bundle/ctrlp.vim
    - require:
      - user: mmeister

papercolor-vim:
  cmd.run:
    - name: |
        mkdir -p ~/.vim/colors; \
        curl https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim > /home/mmeister/.vim/colors/PaperColor.vim
    - unless: test -f /home/mmeister/.vim/colors/PaperColor.vim
    - require:
      - user: mmeister

papercolor-gnome-terminal:
  cmd.run:
    - name: |
        curl https://raw.githubusercontent.com/NLKNguyen/papercolor-16/master/gnome-terminal/base16-papercolor-light.sh | sed 's/gconftool/gconftool-2/g' | bash
