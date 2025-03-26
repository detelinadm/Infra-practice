#!/bin/bash
set -o nounset -o pipefail -o errexit

# Load all variables from .env and export them all for Ansible to read
set -o allexport
source "$(dirname "$0")/ansible_quickstart/.env"
set +o allexport

# Run database playbook
ansible-playbook -i ansible_quickstart/inventory ansible_quickstart/database.yml "$@"

# Run webserver playbook 
ansible-playbook -i ansible_quickstart/inventory ansible_quickstart/webserver.yml "$@"
