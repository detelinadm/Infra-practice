#!/bin/bash
set -o nounset -o pipefail -o errexit

# Load all variables from .env and export them all for Ansible to read
set -o allexport
source "$(dirname "$0")/ansible-quickstart/.env"
set +o allexport

# Run database playbook
ansible-playbook -i inventory ansible-quickstart/database.yml "$@"

# Run webserver playbook 
ansible-playbook -i inventory ansible-quickstart/webserver.yml "$@"
