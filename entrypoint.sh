#!/bin/sh
set -e

# Ensure user/group exist for ssh
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
envsubst < /passwd.template > /tmp/passwd

if [ "$1" = 'ansible-playbook' ]; then
  if [ ! -z "$GIT_REPO" ]; then
    rm -rf playbook
    git clone $GIT_REPO playbook
  fi

  if [ -f playbook/requirements.yml ]; then
    ansible-galaxy install -r playbook/requirements.yml -f
  fi
fi

exec "$@"