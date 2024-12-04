#!/bin/bash

# Give processes executed with the "kolla" group the permission to create files
# and sub-directories in the /var/log/kolla directory.

USERGROUP="ovn-bgp-agent:kolla"
OVN_BGP_AGENT_DIR="/var/lib/ovn-bgp-agent"

if [[ (-d ${OVN_BGP_AGENT_DIR}}) && ($(stat -c %U:%G ${OVN_BGP_AGENT_DIR}) != "${USERGROUP}") ]]; then
    sudo chown ${USERGROUP} ${OVN_BGP_AGENT_DIR}
fi

