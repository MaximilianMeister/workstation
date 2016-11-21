#!/bin/bash

#
# this script needs to be run on the workstation initially
# it can be run multiple times
#

log()   { echo ">>> $1" ; }
warn()  { log "WARNING: $1" ; }
abort() { log "FATAL: $1" ; exit 1 ; }

# configure and start local minion
setup_minion() {
    log "Setting up and configuring minion"
    zypper -n refresh
    zypper -n install salt-minion git
    systemctl enable salt-minion
    cat <<EOF > /etc/salt/minion
file_client: local
file_roots:
  base:
    - /srv/salt
EOF
    systemctl restart salt-minion
}

# get dependent infrastructure code
get_infrastructure() {
    log "Getting infrastructure code"
    git clone git://github.com/MaximilianMeister/workstation.git /srv/salt
}

apply() {
    log "Applying salt configuration"
    salt-call state.apply
}

main() {
    pushd /srv/salt 2>&1 > /dev/null

    setup_minion
    get_infrastructure
    apply

    popd 2>&1 > /dev/null
}

main
