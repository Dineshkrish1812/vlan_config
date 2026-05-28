#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

export ANSIBLE_CONFIG="$PWD/ansible.cfg"

playbook="${1:-playbooks/vlan.yml}"
if [[ "$playbook" == -* ]]; then
  playbook="playbooks/vlan.yml"
else
  shift || true
fi

exec ansible-playbook -i inventory.ini "$playbook" "$@"
